window.onload = onPageLoad();
function onPageLoad() {
	document.getElementById("gmet").checked = true;
	document.getElementById("meta").checked = true;
	document.getElementById("amet").checked = true;
	document.getElementById("smet").checked = true;
	document.getElementById("notam").checked = true;

	document.getElementById("gmsliderRange").step = "1000";
	document.getElementById("amsliderRange").step = "1000";
	document.getElementById("smsliderRange").step = "1000";
	document.getElementById("gmsliderRange").value = "0";
	document.getElementById("amsliderRange").value = "0";
	document.getElementById("smsliderRange").value = "0";
}

function reloadFunc(obj){
			  location.reload();
	}

var map = L.map('map').setView([36.0, -75.26], 5); 

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
	return 	colf >=	60000 ? '#67BDE9':
			colf >=	50000 ? '#6EBAE0':
			colf >=	43000 ? '#75B7D6':
			colf >=	42000 ? '#7CB4CD':
			colf >=	40000 ? '#83B1C3':
			colf >=	32000 ? '#8AADBA':
			colf >=	24000 ? '#91AAB0':
			colf >=	22000 ? '#98A7A7':
			colf >=	20000 ? '#9FA49D':
			colf >=	18000 ? '#A6A194':
			colf >=	16000 ? '#AD9E8A':
			colf >=	12000 ? '#B49B81':
			colf >=	10000 ? '#BB9877':
			colf >=	9000  ? '#C2956E':
			colf >=	8000  ? '#C99264':
			colf >=	7000  ? '#D08E5B':
			colf >=	6000  ? '#D78B51':
			colf >=	4000  ? '#DE8848':
			colf >=	1000  ? '#E5853E':
			colf >=	0 	  ?	'#EC8235':
							'blue';
}	

// G-AIRMET

var gairmet = L.realtime({
     	url: 'http://localhost:4000/gairmet.geojson',
		crossOrigin: true, type: 'json'
	}, {interval: 12 * 1000,
		style: function(feature){
			kolor  = getColor(feature.properties.Alt);
			return { color: '#5D8C8C', weight: 2, fillColor: kolor,opacity: 1.0,fillOpacity: 0.2};
		},
			getFeatureId: function(featureData){
				return featureData.properties.RepNum;
		},
 			onEachFeature: function (feature, layer){
				layer.bindTooltip('G-AIRMET: Alt '+ feature.properties.Alt);
	           	layer.on('click',function(e){
					layer.setStyle({color: 'yellow',opacity: 0.8, fillColor: 'yellow', fillOpacity: 0.5});
					$('#f11').html('G-AIRMET');
					$('#f12').html(e.target.feature.properties.Alt);
					$('#f13').html(e.target.feature.properties.RepNum);
					$('#f14').html(e.target.feature.properties.Ob);
					gairmet.stop();});
	           layer.on('mouseout',function(e){
					gairmet.start();})		
			},
				filter: function(feature, layer) {   
//					var n = document.getElementById("bgalt").value;
					var rangeslider = document.getElementById("gmsliderRange");
					var output = document.getElementById("demo");
					if (rangeslider.value== -1000) output.innerHTML = "All"
					 else output.innerHTML = rangeslider.value;
				 
					var nn = parseInt(rangeslider.value, 10);
//					var nn = parseInt(n, 10);
					if (nn== -1000) return (feature.properties.Alt)
					else
					return (feature.properties.Alt >= (nn-500) && feature.properties.Alt <= (nn +500) );
				}
		}).addTo(map);  

// AIRMET
var	airmet = L.realtime({
     	url: 'http://localhost:4000/airmet.geojson',
		crossOrigin: true, type: 'json'
	}, {interval: 12 * 1020,
		style: function(feature){
			kolor  = getColor(feature.properties.Alt);
				return { color: '#00cccc', weight: 2, fillColor: kolor,opacity: 1.0,fillOpacity: 0.2};
		},
			getFeatureId: function(featureData){
				return featureData.properties.RepNum;
		},
			onEachFeature: function (feature, layer) 
			{
				layer.bindTooltip('AIRMET: Alt ' + feature.properties.Alt);
	           	layer.on('click',function(e){
					layer.setStyle({fillColor: 'yellow', fillOpacity: 0.5});
					$('#f11').html('AIRMET');
					$('#f12').html(e.target.feature.properties.Alt);
					$('#f13').html(e.target.feature.properties.RepNum);
					$('#f14').html('n/a');
					airmet.stop();});
	           layer.on('mouseout',function(e){
					airmet.start();})		
			},
				filter: function(feature,layer) {   
//					var n = document.getElementById("agalt").value;
					var rangeslider = document.getElementById("amsliderRange");
					var output = document.getElementById("demo1");
					if (rangeslider.value== -1000) output.innerHTML = "All"
					 else output.innerHTML = rangeslider.value;
					var nn = parseInt(rangeslider.value, 10);
					if (nn== -1000) return (feature.properties.Alt)
					else
					return (feature.properties.Alt >= (nn-500) && feature.properties.Alt <= (nn +500) );
				}
		}).addTo(map);

// SIGMET
var	sigmet = L.realtime({
     	url: 'http://localhost:4000/sigmet.geojson',
		crossOrigin: true, type: 'json'
	}, {interval: 12 * 1030,
		style: function(feature){
			kolor  = getColor(feature.properties.Alt);
				return { color: '#00cccc', weight: 2, fillColor: kolor,opacity: 1.0,fillOpacity: 0.2};
		},
			getFeatureId: function(featureData){
				return featureData.properties.RepNum;
		},
			onEachFeature: function (feature, layer) 
			{
				layer.bindTooltip('SIGMET: Alt ' + feature.properties.Alt);
	           	layer.on('click',function(e){
					layer.setStyle({fillColor: 'yellow', fillOpacity: 0.5});
					$('#f11').html('SIGMET');
					$('#f12').html(e.target.feature.properties.Alt);
					$('#f13').html(e.target.feature.properties.RepNum);
					$('#f14').html('n/a');
					sigmet.stop();});
	           layer.on('mouseout',function(e){
					sigmet.start();})		
			},
				filter: function(feature,layer) {   
//					var n = document.getElementById("sgalt").value;
					var rangeslider = document.getElementById("smsliderRange");
					var output = document.getElementById("demo2");
					if (rangeslider.value== -1000) output.innerHTML = "All"
					 else output.innerHTML = rangeslider.value;
					var nn = parseInt(rangeslider.value, 10);
					if (nn== -1000) return (feature.properties.Alt)
					else
					return (feature.properties.Alt >= (nn-500) && feature.properties.Alt <= (nn +500) );
				}
		}).addTo(map);  

// ** METAR 

var wxIcon = L.icon({iconUrl: 'therm.ico', iconSize: [35,35]});

metar = L.realtime({
	url:  'http://localhost:4000/sql?q=select s.coords as geom,m.stn_call,s.stn_loc,ob_date,' 
	+ 'temp,windsp,winddir,altimeter,visby,dewp '
	+ 'from metar m ,stations s where m.stn_call=s.stn_call',
		crossOrigin: true, type: 'json'
	}, {interval: 17 * 1000,
  		getFeatureId: function(featureData) {
			return featureData.properties.stn_call;
		},
		pointToLayer: function (feature, latlng) {
			marker = L.marker(latlng,{icon: wxIcon});
    		marker.bindTooltip(feature.properties.stn_call 
    				+ '<br>' + feature.properties.temp   +'&#x2109');
 			marker.on('click', function (e) {
					$('#f1').html(e.target.feature.properties.stn_call);
					$('#f2').html(e.target.feature.properties.stn_loc);
					$('#f3').html(e.target.feature.properties.ob_date);
					$('#f4').html(e.target.feature.properties.temp);
					$('#f5').html(e.target.feature.properties.windsp);  
					$('#f6').html(e.target.feature.properties.visby);
			});
    		marker.addTo(map);
    		return marker;
		}
	}).addTo(map);

// ** NOTAM 
var wxIcon2 = L.icon({iconUrl: 'wx2.ico', iconSize: [20,20]});

notam = L.realtime({
	url: 'http://localhost:4000/sql?q=select coords as geom,n.stn_call,stn_loc,rep_num,notam_text ' 
	+ 'from notam n, stations s where n.stn_call=s.stn_call',
		crossOrigin: true, type: 'json'
	}, {interval: 19 * 1000,
  		getFeatureId: function(featureData) {
			return featureData.properties.stn_call;
		},
		pointToLayer: function (feature, latlng) {
			marker = L.marker(latlng,{icon: wxIcon2});
    		marker.bindTooltip(feature.properties.stn_call);
 			marker.on('click', function (e) {
					$('#f1').html(e.target.feature.properties.stn_call);
					$('#f2').html(e.target.feature.properties.stn_loc);
					$('#f3').html(e.target.feature.properties.rep_num);
					$('#f4').html(e.target.feature.properties.notam_text);
//					$('#f5').html(e.target.feature.properties.WindSp);  
//					$('#f6').html(e.target.feature.properties.Vsby);
			});
    		marker.addTo(map);
    		return marker;
		}
	}).addTo(map);

// Handles the check boxes being turned on/off
document.querySelector("input[name=gmet]").addEventListener('change', function() {
                if(this.checked) {map.addLayer(gairmet),gairmet.start()}
                  else {map.removeLayer(gairmet),gairmet.stop()}
                })
   
document.querySelector("input[name=amet]").addEventListener('change', function() {
                if(this.checked)  {map.addLayer(airmet),airmet.start()}
                  else {map.removeLayer(airmet),airmet.stop()}
                })

document.querySelector("input[name=meta]").addEventListener('change', function() {
                if(this.checked)  {map.addLayer(metar),metar.start()}
                  else {map.removeLayer(metar),metar.stop()}
                })

document.querySelector("input[name=notam]").addEventListener('change', function() {
                if(this.checked)  {map.addLayer(notam),notam.start()}
                  else {map.removeLayer(notam),notam.stop()}
                })

document.querySelector("input[name=smet]").addEventListener('change', function() {
                if(this.checked)  {map.addLayer(sigmet),sigmet.start()}
                  else {map.removeLayer(sigmet),sigmet.stop()}
                })

//document.getElementById("bgalt").onchange = function()
//		{gairmet.update()}
		                
//document.getElementById("agalt").onchange = function()
//		{airmet.update()}

//document.getElementById("sgalt").onchange = function()
//		{sigmet.update()}  
		
document.getElementById("gmsliderRange").onchange = function()
	{gairmet.update()}
document.getElementById("amsliderRange").onchange = function()
	{airmet.update()}
document.getElementById("smsliderRange").onchange = function()
	{sigmet.update()}


//Add layer control
var baseMaps = {
    "Open Street Map": osm,
    "Imagery":Esri_WorldImagery,
	"Gray":Esri_WorldGrayCanvas,
	"OSM B&W":OpenStreetMap_BlackAndWhite
};

var overlayMaps = {};
L.control.layers(baseMaps, overlayMaps).addTo(map);
