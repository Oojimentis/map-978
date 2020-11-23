
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
        url: 'http://localhost:8080/geo3.txt',
        crossOrigin: true,
        type: 'json'
    }, {interval: 10 * 1000
    }).addTo(map);
//    	getFeatureId: function(realtime) {
//    	  return realtime.properties.Location;
//    },
//          onEachFeature(realtime, l){
//    	 l.bindPopup(function() {
//             return f.properties.Location ;
    	
    	

realtime.on('update', function() {
    map.fitBounds(realtime.getBounds(), {maxZoom: 3});
});	
	
	
	
	var myStyle = {
			"color": "#ff7800",
   		    "weight": 5,
   		    "opacity": 0.65
   		};
 	
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


	
	
