
var map = L.map('map').setView([ 40.355, -75.15], 4);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
 maxZoom: 19,
 attribution: '&copy; <a href="https://openstreetmap.org/copyright">OpenStreetMap contributors</a>'
      }).addTo(map);

	L.control.scale().addTo(map);
      
	$.getJSON("region.geo",function(hoodData){
		function onEachFeature(feature,layer){
			layer.bindPopup(feature.properties.Named);
		}
		var geojson = L.geoJson(hoodData, { 
			onEachFeature: onEachFeature
		}).addTo(map);
	});  

    realtime = L.realtime({
    	url: 'http://localhost:8000/metar.geojson',
        crossOrigin: true,
        type: 'json'
    }, {interval: 3 * 1000,
    	getFeatureId: function(featureData) {
    		return featureData.properties.Stn,featureData.properties.WindSp;
    	},
    	pointToLayer: function (feature, latlng) {
    		marker = L.marker(latlng);
    		marker.bindPopup('<b><u>'+feature.properties.Stn +'</b></u>' 	
    			 + '<br>Wind Speed: ' + feature.properties.WindSp
    			 + '<br>Altimeter: ' + feature.properties.Alt
    			 + '<br>Visibility: '+ feature.properties.Vsby
    			 + '<br>Dew Point: '+ feature.properties.DewP
    			 + '<br>Temp(c): '+ feature.properties.Temp
    			 + '<br>Wind Direction: '+ feature.properties.WindDir
    	 );
    		marker.addTo(map);
    		return marker;
    	}
    }).addTo(map);
    

//  realtime.on('update', function() {
//  map.fitBounds(realtime.getBounds(), {maxZoom: 8});
//  map.fitBounds(realtime.getBounds());
//});	

/*
	var myStyle = {
			"color": "#ff7800",
   		    "weight": 5,
   		    "opacity": 0.65
   		};
*/	
/*	
	$.getJSON("geo2.txt",function(data){
		function onEachFeature(feature,layer){
			layer.bindPopup(feature.properties.MSG + '<br/>' + feature.properties.Location);
		}
		var moo = L.geoJson(data,{
			onEachFeature: onEachFeature
		}).addTo(map);
	});     
*/
