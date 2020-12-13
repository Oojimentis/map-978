function reloadFunc(obj){
		  location.reload();
	}

var map = L.map('map').setView([39.0, -98.26], 4); 

var osm=new L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',{ 
		attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'}).addTo(map);;
		
var Esri_WorldImagery = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
		attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'
});

var Esri_WorldGrayCanvas = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}', {
		attribution: 'Tiles &copy; Esri &mdash; Esri, DeLorme, NAVTEQ',
		maxZoom: 16
});

var OpenStreetMap_BlackAndWhite = L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
		maxZoom: 18,
		attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
});

// Set function for color ramp, used for both layers
function getColor(colf){
	return 	colf >= 50000 ? '#800026':
			colf >= 30000 ? '#BD0026':
			colf >= 20000 ? '#E31A1C':
			colf >= 16000 ? '#FC4E2A':
			colf >= 10000 ? '#FD8D3C':
			colf >= 7000  ? '#FEB24C':
			colf >= 5000  ? '#FED976':
			colf >= 2000  ? '#008080':
								'blue';
}	

// G-AIRMET
var gairmet;	
var url = 'gairmet.geojson'; 

 $.getJSON(url, function(data) {
     gairmet = L.geoJson(data, {
		style: function(feature){
			kolor  = getColor(feature.properties.Alt);
			return { color: '#0080FF', weight: 2, fillColor: 'yellow',opacity: 0.3,fillOpacity: 0.7};
		},
 			onEachFeature: function (feature, layer){
				layer.bindTooltip('Altitude:' + feature.properties.Alt + ' RepID:' + feature.properties.RepNum
						+ '<br>' + feature.properties.Ob);
				},   
				filter: function(feature, layer) {   
					var n = document.getElementById("bgalt").value;
					var nn = parseInt(n, 10);
					return (feature.properties.Alt >= nn );
				}
		}).addTo(map);  //Note turned on to start map with Data, Checkbox has checked property.
});

// AIRMET
var airmet;	
var url2 = 'airmet.geojson';
 	
 $.getJSON(url2, function(data2) {
	airmet = L.geoJson(data2, {
		style: function(feature){
			kolor  = getColor(feature.properties.Alt);
			return { color: '#0080FF', weight: 2, fillColor: 'green',opacity: 0.3,fillOpacity: 0.7};
		},
			onEachFeature: function (feature, layer) {
				layer.bindTooltip('AIRMET: Rep ID:' + feature.properties.RepNum
						+ '<br>Altitude: ' + feature.properties.Alt	) ;
				},
				filter: function(feature,layer) {   
					var n = document.getElementById("agalt").value;
					var nn = parseInt(n, 10);
					return (feature.properties.Alt >= nn );
				}
		}).addTo(map);
});


// ** METAR 
var wxIcon = L.icon({iconUrl: 'therm.ico', iconSize: [35,25]});

realtime = L.realtime({
	url: 'http://localhost:8000/metar.geojson',
		crossOrigin: true, type: 'json'
	}, {interval: 3 * 1000,
  		getFeatureId: function(featureData) {
			return featureData.properties.Stn;
		},
		pointToLayer: function (feature, latlng) {
			marker = L.marker(latlng,{icon: wxIcon});
    		marker.bindTooltip(feature.properties.Stn 
    				+ '<br>' + feature.properties.Temp    				
    		);
 			marker.on('click', function (e) {
					$('#f1').html(e.target.feature.properties.Stn);
					$('#f2').html(e.target.feature.properties.Loc);
					$('#f3').html(e.target.feature.properties.ObDate);
					$('#f4').html(e.target.feature.properties.Temp);
					$('#f5').html(e.target.feature.properties.WindSp);  
					$('#f6').html(e.target.feature.properties.Vsby);
			});
    		marker.addTo(map);
    		return marker;
		}
	}).addTo(map);

// Handles the check boxes being turned on/off
document.querySelector("input[name=bball]").addEventListener('change', function() {
                if(this.checked) map.addLayer(gairmet)
                  else map.removeLayer(gairmet)
                })
                
document.querySelector("input[name=foot]").addEventListener('change', function() {
                if(this.checked) map.addLayer(airmet)
                  else map.removeLayer(airmet)
                })


//Add layer control
var baseMaps = {
    "Open Street Map": osm,
    "Imagery":Esri_WorldImagery,
	"Gray":Esri_WorldGrayCanvas,
	"OSM B&W":OpenStreetMap_BlackAndWhite
};

var overlayMaps = {};
L.control.layers(baseMaps, overlayMaps).addTo(map);
