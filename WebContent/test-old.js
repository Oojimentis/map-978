
var map = L.map('map').setView([ 40.355, -75.15],6);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
 maxZoom: 19,
 attribution: '&copy; <a href="https://openstreetmap.org/copyright">OpenStreetMap contributors</a>'
      }).addTo(map);

      L.control.scale().addTo(map);
      
   	 $.getJSON("region.geo",function(hoodData){
   		function onEachFeature(feature,layer){
   	  		      layer.bindPopup(feature.properties.Named);
   	  		           }
   	     L.geoJson(hoodData, {
   	        onEachFeature: onEachFeature
   	      	  }).addTo(map);
   	  	  		});  

   	  	 $.getJSON("geo.txt",function(data){
   	    L.geoJson(data,{
   	  		 pointToLayer: function(feature,latlng ){
   	        var marker = L.marker(latlng)
   	     marker.bindPopup(feature.properties.Location + '<br/>' + feature.properties.MSG);
   	        return marker; 
   	        }
   	  		 })  .addTo(map);
   	   });     

