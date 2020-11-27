
var map = L.map('map').setView([ 40.855, -73.15], 9);

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
//    		return featureData.properties.Stn,featureData.properties.WindSp;
    		return featureData.properties.Stn;
    	},
    	pointToLayer: function (feature, latlng) {
    		marker = L.marker(latlng);
    		marker.bindPopup('<b><u>'+feature.properties.Stn +'</b></u>' 
    				+ '<br>Obs Date :' + '<b>' + feature.properties.ObDate  + '</b>'	
    				+ '<br>Temp(f)  :' + '<b>' + feature.properties.Temp    + '</b>'    				
    				+ '<br>Wind Sp  :' + '<b>' + feature.properties.WindSp  + '</b>'
    				+ '<br>Wind Dir  :' + '<b>' + feature.properties.WindDir + '</b>'    				
    				+ '<br>Altimeter  :' + '<b>' + feature.properties.Alt     + '</b>'
    				+ '<br>Visibility  : ' + '<b>' + feature.properties.Vsby    + '</b>'
    				+ '<br>Dew Pt(f)  :' + '<b>' + feature.properties.DewP    + '</b>'
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
