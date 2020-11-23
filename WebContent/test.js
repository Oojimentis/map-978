
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
    }, {interval: 10 * 1000,


    	getFeatureId: function(featureData) {
    	  return featureData.properties.Location;
   },
     pointToLayer: function (feature, latlng) {
      marker = L.marker(latlng);
      marker.bindPopup('location: ' + feature.properties.Location + feature.properties.Stuff);
      marker.addTo(map);
      return marker;
    }
    
}).addTo(map);
    

//realtime.on('update', function() {
//    map.fitBounds(realtime.getBounds(), {maxZoom: 3});
//  map.fitBounds(realtime.getBounds());

//});	
	
	
	
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


	
	
