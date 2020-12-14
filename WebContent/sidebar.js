function reloadFunc(obj){
		  location.reload();
	}

var map = L.map('map').setView([39.0, -88.26], 5); 

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

function getColor(colf){
	return 	colf >=	60000 ? '#ff9999':
			colf >=	50000 ? '#ffb399':
			colf >=	43000 ? '#ffcc99':
			colf >=	42000 ? '#ffe699':
			colf >=	40000 ? '#e6ff99':
			colf >=	32000 ? '#ccff99':
			colf >=	24000 ? '#b3ff99':
			colf >=	22000 ? '#99ff99':
			colf >=	20000 ? '#99ffb3':
			colf >=	18000 ? '#99ffcc':
			colf >=	16000 ? '#99ffe6':
			colf >=	12000 ? '#99ffff':
			colf >=	10000 ? '#99e6ff':
			colf >=	9000  ? '#99ccff':
			colf >=	8000  ? '#99b3ff':
			colf >=	7000  ? '#9999ff':
			colf >=	6000  ? '#b399ff':
			colf >=	4000  ? '#cc99ff':
			colf >=	1000  ? '#e699ff':
			colf >=	0 	  ?	'#ff99ff':
							'blue';
}	

// G-AIRMET
var gairmet = L.realtime({
     	url: 'http://localhost:8000/gairmet.geojson',
		crossOrigin: true, type: 'json'
	}, {interval: 3 * 1000,
		style: function(feature){
			kolor  = getColor(feature.properties.Alt);
			return { color: '#00cccc', weight: 2, fillColor: kolor,opacity: 1.0,fillOpacity: 0.2};
		},
			getFeatureId: function(featureData){
				return featureData.properties.RepNum;
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
;

// AIRMET
var	airmet = L.realtime({
     	url: 'http://localhost:8000/airmet.geojson',
		crossOrigin: true, type: 'json'
	}, {interval: 3 * 1020,
		style: function(feature){
			kolor  = getColor(feature.properties.Alt);
				return { color: '#00cccc', weight: 2, fillColor: kolor,opacity: 1.0,fillOpacity: 0.2};
		},
			getFeatureId: function(featureData){
				return featureData.properties.RepNum;
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
		})  ;   //.addTo(map);
;

// SIGMET
var	sigmet = L.realtime({
     	url: 'http://localhost:8000/sigmet.geojson',
		crossOrigin: true, type: 'json'
	}, {interval: 3 * 1030,
		style: function(feature){
			kolor  = getColor(feature.properties.Alt);
				return { color: '#00cccc', weight: 2, fillColor: kolor,opacity: 1.0,fillOpacity: 0.2};
		},
			getFeatureId: function(featureData){
				return featureData.properties.RepNum;
		},
			onEachFeature: function (feature, layer) {
				layer.bindTooltip('SIGMET: Rep ID:' + feature.properties.RepNum
						+ '<br>Altitude: ' + feature.properties.Alt	);
				},
				filter: function(feature,layer) {   
					var n = document.getElementById("sgalt").value;
					var nn = parseInt(n, 10);
					return (feature.properties.Alt >= nn );
				}
		}) ;  //.addTo(map);
;

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
    				+ '<br>' + feature.properties.Temp   +'&#x2109');
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
document.querySelector("input[name=gmet]").addEventListener('change', function() {
                if(this.checked) map.addLayer(gairmet)
                  else map.removeLayer(gairmet)
                })
                
document.querySelector("input[name=amet]").addEventListener('change', function() {
                if(this.checked) map.addLayer(airmet)
                  else map.removeLayer(airmet)
                })

document.querySelector("input[name=meta]").addEventListener('change', function() {
                if(this.checked) map.addLayer(realtime)
                  else map.removeLayer(realtime)
                })
document.querySelector("input[name=smet]").addEventListener('change', function() {
                if(this.checked) map.addLayer(sigmet)
                  else map.removeLayer(sigmet)
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
