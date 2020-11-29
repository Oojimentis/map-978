
var map = L.map('map').setView([ 40.855, -73.15], 5);

L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
 maxZoom: 19,
 attribution: '&copy; <a href="https://openstreetmap.org/copyright">OpenStreetMap contributors</a>'
      }).addTo(map);

	L.control.scale().addTo(map);
 /*   
	$.getJSON("airmet.geojson",function(hoodData){
		function onEachFeature(feature,layer){
			layer.bindPopup(feature.properties.RepNum);
		}
		var geojson = L.geoJson(hoodData, { 
			onEachFeature: onEachFeature
		}).addTo(map);
	});  
*/

	L.realtime({url: 'http://localhost:8000/airmet.geojson',
 		crossOrigin: true, type: 'json'},  {interval: 3 * 1000,
        style: function(feature){
// var fillColor = '#' +Math.floor(Math.random()*16777215).toString(16);
		var fillColor;
 		var  alt = feature.properties.Alt;
 		if  ( alt > 50000 ) fillColor = "#0000FF";
      		else if ( alt > 30001 ) fillColor = "#FFFF00";
      		else if ( alt > 20001 ) fillColor = "#FF00FF";
      		else if ( alt > 16000 ) fillColor = "#32CD32";
      		else if ( alt > 10000 ) fillColor = "#800000";
      		else if ( alt > 7000 )  fillColor = "#008000";
      		else if ( alt > 5000 )  fillColor = "#FF8C00";
      		else if ( alt > 2000 )  fillColor = "#008080";
      		else if ( alt > 999 )   fillColor = "#000080";
      		else fillColor = "#000000";  // no data
  		return { color: "#999", weight: 1, fillColor: fillColor, fillOpacity: .2 };
    },
        getFeatureId: function(featureData){
			return featureData.properties.RepNum;
        },
    
		onEachFeature: function(feature,layer){
			layer.bindPopup('AIRMET: Rep ID:' + feature.properties.RepNum
								+ '<br>Altitude: ' + feature.properties.Alt	
			)}}
		).addTo(map);
  
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
