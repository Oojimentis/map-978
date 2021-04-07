var serv_port = document.getElementById('port').value;
var url1 = "http://localhost:";
var url = url1.concat(serv_port,"/sql?q=");

window.onload = onPageLoad();

function onPageLoad() {
	document.getElementById("gmet").checked  = true;
	document.getElementById("meta").checked  = true;
	document.getElementById("amet").checked  = true;
	document.getElementById("smet").checked  = true;
	document.getElementById("cwa").checked   = true;
	document.getElementById("notam").checked = true;
	document.getElementById("taf").checked   = true;
	document.getElementById("pirep").checked = true;
	document.getElementById("nrad").checked = true;

	document.getElementById("gmsliderRange").step = "1000";
	document.getElementById("gmsliderRange").value = "0";
}

function reloadFunc(obj) {
	location.reload();
}

function right(str, chr) {
	return str.slice(str.length - chr, str.length);
}

var map = L.map('map', {preferCanvas: true}).setView([36.0, -75.26], 5); 

var osm=new L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',{ 
	attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'});
var Esri_WorldImagery = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
	attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'
}).addTo(map);
var Esri_WorldGrayCanvas = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}', {
	attribution: 'Tiles &copy; Esri &mdash; Esri, DeLorme, NAVTEQ',	maxZoom: 16
});
var OpenStreetMap_BlackAndWhite = L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
	maxZoom: 18,
	attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
});

function getColor(colf) {
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

function getColorInt(colf) {
switch (colf) {
case 1:
	golor = '#8C8C74';
	break;
case 2:
	golor = '#B4C8FF';
	break;
case 3:
	golor = '#5F87FF';
	break;
case 4:
	golor = '#1446E6';
	break;
case 5:
	golor = '#6EF54B';
	break;
case 6:
	golor = '#00C300';
	break;
case 7:
	golor = '#007300';
	break;
case 8:
	golor = '#FFFF00';
	break;	
case 9:
	golor = '#FFB430';
	break;
case 10:
	golor = '#FA7D00';
	break;	
case 11:
	golor = '#E62D00';
	break;
case 12:
	golor = '#AF0000';
	break;	
case 13:
	golor = '#690000';
	break;	
case 14:
	golor = '#FA00C8';	
	break;
case 15:
	golor = '#9B00FA';	
	break;	
		}
return golor;
}

// G-AIRMET
var url_gairmet = url.concat("SELECT coords AS GEOM, rep_num, alt, ob_ele, start_date, stop_date \
				              FROM graphics WHERE prod_id = 14");

var gairmet = L.realtime({
	url: url_gairmet,
	crossOrigin: true, type: 'json'
	}, {interval: 12 * 1000,
		style: function(feature){
			kolor = getColor(feature.properties.alt);
			return {color: '#5D8C8C', weight: 2, fillColor: kolor, opacity: 1.0, fillOpacity: 0.2};
		},
		getFeatureId: function(featureData){
			return featureData.properties.rep_num;
		},
		onEachFeature: function(feature, layer){
			layer.bindTooltip('G-AIRMET: Alt '+ feature.properties.alt + '<br>' + feature.properties.ob_ele);
			layer.on('click', function(e){
				layer.setStyle({color: 'yellow', opacity: 0.8, fillColor: 'yellow', fillOpacity: 0.5});
				$("#m1").html("Report");
				$("#m2").html("Altitude");					
				$("#m3").html("Report Num");
				$("#m4").html("Condition");
				$("#m5").html("Start");
				$("#m6").html("Stop");
						
				$('#f1').html('G-AIRMET');
				$('#f2').html(e.target.feature.properties.alt);
				$('#f3').html(e.target.feature.properties.rep_num);
				$('#f4').html(e.target.feature.properties.ob_ele);
				$('#f5').html(e.target.feature.properties.start_date);
				$('#f6').html(e.target.feature.properties.stop_date);

				gairmet.stop();});
			layer.on('mouseout', function(e){
				gairmet.start();})		
			},
			filter: function(feature, layer) {   
				var rangeslider = document.getElementById("gmsliderRange");
				var output = document.getElementById("demo");
				if (rangeslider.value == -1000) 
					output.innerHTML = "All"
				else 
					output.innerHTML = rangeslider.value;

				var nn = parseInt(rangeslider.value, 10);
				var e = document.getElementById("stim");
				var stim = e.value;
				if (nn == -1000) 
					return (feature.properties.alt >= 0 && right(feature.properties.start_date, 5) == stim)
				else 
					return (feature.properties.alt >= (nn - 500) && feature.properties.alt <= (nn + 500) && right(feature.properties.start_date, 5) == stim); 
			}
		}).addTo(map);  

// AIRMET
var url_airmet = url.concat("SELECT coords AS GEOM, g.rep_num, alt, ob_ele, text_data, start_date, stop_date \
			                 FROM graphics g LEFT JOIN sigairmet s ON (g.prod_id = s.prod_id) AND (g.rep_num = s.rep_num) \
			                 WHERE g.prod_id = 11");

var	airmet = L.realtime({
	url: url_airmet,
	crossOrigin: true, type: 'json'
	}, {interval: 19 * 1020,
		style: function(feature){
			kolor = getColor(feature.properties.alt);
			return {color: '#00cccc', weight: 2, fillColor: kolor, opacity: 1.0, fillOpacity: 0.2};
		},
		getFeatureId: function(featureData){
			return featureData.properties.rep_num;
		},
		onEachFeature: function(feature, layer) {
			layer.bindTooltip('AIRMET: Alt ' + feature.properties.alt);
			layer.on('click', function(e){
				layer.setStyle({fillColor: 'yellow', fillOpacity: 0.5});

				$("#m1").html("Report");
				$("#m2").html("Altitude");					
				$("#m3").html("Report Num");
				$("#m4").html("Condition");
				$("#m5").html("Start");
				$("#m6").html("Stop");
					
				$('#f1').html('AIRMET');
				$('#f2').html(e.target.feature.properties.alt);
				$('#f3').html(e.target.feature.properties.rep_num);
				$('#f4').html(e.target.feature.properties.text_data);
				$('#f5').html(e.target.feature.properties.start_date);
				$('#f6').html(e.target.feature.properties.stop_date);

				airmet.stop();});
			layer.on('mouseout', function(e){
				airmet.start();})		
			},
			filter: function(feature,layer) {   
				var rangeslider = document.getElementById("gmsliderRange");
				var output = document.getElementById("demo");
				if (rangeslider.value == -1000) 
					output.innerHTML = "All"
				else 
					output.innerHTML = rangeslider.value;

				var nn = parseInt(rangeslider.value, 10);
				if (nn == -1000) 
					return (feature.properties.alt >= 0)
				else 
					return (feature.properties.alt >= (nn - 500) && feature.properties.alt <= (nn + 500));
			}
		}).addTo(map);

// SIGMET
var url_sigmet = url.concat("SELECT coords AS GEOM, g.rep_num, alt, ob_ele, text_data, start_date, stop_date \
			                 FROM graphics g LEFT JOIN sigairmet s ON (g.prod_id = s.prod_id) AND (g.rep_num = s.rep_num) \
			                 WHERE g.prod_id = 12");

var	sigmet = L.realtime({
	url: url_sigmet,
	crossOrigin: true, type: 'json'
	}, {interval: 15 * 1030,
		style: function(feature){
			kolor = getColor(feature.properties.alt);
			return {color: '#00cccc', weight: 2, fillColor: kolor, opacity: 1.0, fillOpacity: 0.2};
		},
		getFeatureId: function(featureData){
			return featureData.properties.rep_num;
		},
		onEachFeature: function(feature, layer) {
			layer.bindTooltip('SIGMET: Alt ' + feature.properties.alt);
			layer.on('click', function(e){
				layer.setStyle({fillColor: 'yellow', fillOpacity: 0.5});

				$("#m1").html("Report");
				$("#m2").html("Altitude");					
				$("#m3").html("Report Num");
				$("#m4").html("Condition");
				$("#m5").html("Start");
				$("#m6").html("Stop");
					
				$('#f1').html('SIGMET');
				$('#f2').html(e.target.feature.properties.alt);
				$('#f3').html(e.target.feature.properties.rep_num);
				$('#f4').html(e.target.feature.properties.text_data);
				$('#f5').html(e.target.feature.properties.start_date);
				$('#f6').html(e.target.feature.properties.stop_date);
				
				sigmet.stop();});
			layer.on('mouseout',function(e){
				sigmet.start();})		
			},
			filter: function(feature, layer) {   
				var rangeslider = document.getElementById("gmsliderRange");
				var output = document.getElementById("demo");
				if (rangeslider.value == -1000) 
					output.innerHTML = "All"
				else 
					output.innerHTML = rangeslider.value;

				var nn = parseInt(rangeslider.value, 10);
				if (nn == -1000) 
					return (feature.properties.alt >= 0)
				else 
					return (feature.properties.alt >= (nn - 500) && feature.properties.alt <= (nn + 500));
			}
		}).addTo(map);  

// Radar
var url3_rad = url.concat("SELECT coords AS GEOM, intensity ,block_num, cc \
                           FROM nexrad84 WHERE prod_id = 84 and intensity !=14 and maptime='0000'");
var moose;
var lays= new L.FeatureGroup();
var	nrad = L.realtime({
	url: url3_rad,
 	crossOrigin: true, type: 'json'
	}, {interval: 7 * 1000,

	getFeatureId: function(featureData){ 
	return featureData.properties.block_num + featureData.properties.cc;
	},

	pointToLayer: function(feature, latlng) {

    var currentPoint = map.latLngToContainerPoint(latlng);
    var width = 2;    //5
    var height = 2;     //5
    var xDifference = width / 2;
    var yDifference = height / 2;
    var southWest = L.point((currentPoint.x - xDifference), (currentPoint.y - yDifference));
    var northEast = L.point((currentPoint.x + xDifference), (currentPoint.y + yDifference));
    var bounds = L.latLngBounds(map.containerPointToLatLng(southWest),map.containerPointToLatLng(northEast));

   	golor = getColorInt(feature.properties.intensity);
   	var rectOptions = {fillColor: golor, fillOpacity: 0.9, weight: 0}
    moose = L.rectangle(bounds,rectOptions);

	lays.addLayer(moose);
	map.addLayer(lays);

	nrad.stop();
   	}
});


// CWA
var url3_cwa = url.concat("SELECT coords AS GEOM, g.rep_num, alt, ob_ele, text_data, start_date, stop_date \
						   FROM graphics g LEFT JOIN sigairmet s ON (g.prod_id = s.prod_id) AND (g.rep_num = s.rep_num) \
			               WHERE g.prod_id = 15");

var	cwa = L.realtime({
	url: url3_cwa,
	crossOrigin: true, type: 'json'
	}, {interval: 10 * 1030,
		style: function(feature){
			kolor = getColor(feature.properties.alt);
			return {color: '#00cccc', weight: 2, fillColor: kolor, opacity: 1.0, fillOpacity: 0.2};
		},
		getFeatureId: function(featureData){
			return featureData.properties.rep_num;
		},
		onEachFeature: function(feature, layer) {
			layer.bindTooltip('CWA: Alt ' + feature.properties.alt);
			layer.on('click', function(e){
				layer.setStyle({fillColor: 'yellow', fillOpacity: 0.5});

				$("#m1").html("Report");
				$("#m2").html("Altitude");					
				$("#m3").html("Report Num");
				$("#m4").html("Condition");
				$("#m5").html("Start");
				$("#m6").html("Stop");
					
				$('#f1').html('CWA');
				$('#f2').html(e.target.feature.properties.alt);
				$('#f3').html(e.target.feature.properties.rep_num);
				$('#f4').html(e.target.feature.properties.text_data);
				$('#f5').html(e.target.feature.properties.start_date);
				$('#f6').html(e.target.feature.properties.stop_date);

				cwa.stop();});
			layer.on('mouseout', function(e){
				cwa.start();})		
			},
			filter: function(feature,layer) {   
				var rangeslider = document.getElementById("gmsliderRange");
				var output = document.getElementById("demo");
				if (rangeslider.value == -1000) 
					output.innerHTML = "All"
				else 
					output.innerHTML = rangeslider.value;

				var nn = parseInt(rangeslider.value, 10);
				if (nn == -1000) 
					return (feature.properties.alt >= 0)
				else 
					return (feature.properties.alt >= (nn - 500) && feature.properties.alt <= (nn + 500));
			}
		}).addTo(map);  


// ** Circle
var url_circle = url.concat("SELECT bot AS GEOM, start_date, stop_date, rep_num, r_lng, r_lat, alt_top, alt_bot, alpha \
		                     FROM circles");

var	cir = L.realtime({
	url: url_circle,
	crossOrigin: true, type: 'json'
	}, {interval: 28 * 1030,
		getFeatureId: function(featureData){
		return featureData.properties.rep_num;
		},
		pointToLayer: function(feature, latlng) {
			marker = L.circleMarker(latlng, {color: 'red', fillcolor: 'yellow'});
    		marker.bindTooltip(feature.properties.rep_num + '<br>' + feature.properties.start_date );
 			marker.on('click', function (e) {
 				$("#m1").html("Altitude");
 				$("#m2").html("Radius");
 				$("#m3").html("Rep Number");
   		    	$("#m4").html("Start");
   			    $("#m5").html("Stop");
   			    $("#m6").html("Alpha ");
				$('#f1').html('Bottom ' + e.target.feature.properties.alt_bot + 'ft<br> Top ' + e.target.feature.properties.alt_top + 'ft');
				$('#f2').html('Lat: ' + e.target.feature.properties.r_lat + ' Lng: ' + e.target.feature.properties.r_lat);
				$('#f3').html(e.target.feature.properties.rep_num);
				$('#f4').html(e.target.feature.properties.start_date);
				$('#f5').html(e.target.feature.properties.stop_date);  
				$('#f6').html(e.target.feature.properties.alpha);
			});
			marker.addTo(map);
			return marker;
		}
	}).addTo(map);

// ** METAR 
var wxIcon = L.icon({iconUrl: 'therm.ico', iconSize: [20,20]});

var url_metar = url.concat("SELECT s.coords AS GEOM, m.stn_call, s.stn_loc, ob_date, temp, windsp, winddir, altimeter, visby, dewp \
			                FROM metar m INNER JOIN (SELECT stn_call, max(ob_date) AS mob FROM metar GROUP BY stn_call) g \
			                ON m.stn_call = g.stn_call AND m.ob_date = g.mob INNER JOIN stations s ON m.stn_call = s.stn_call");

metar = L.realtime({
	url: url_metar,
	crossOrigin: true, type: 'json'
	}, {interval: 17 * 1000,
		getFeatureId: function(featureData) {
		return featureData.properties.stn_call;
		},
		pointToLayer: function(feature, latlng) {
			marker = L.marker(latlng, {icon: wxIcon});
			marker.bindTooltip('METAR' + '<br>' + feature.properties.stn_call 
				+ '<br>' + feature.properties.temp + '&#x2109');
			marker.on('click', function(e) {
				$("#m1").html("Station");
				$("#m2").html("Location");
				$("#m3").html("Time");
	    		$("#m4").html("Temp");
		    	$("#m5").html("Winds");
		    	$("#m6").html("Visibility");
				$('#f1').html(e.target.feature.properties.stn_call + " (METAR)");
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
var wxIcon2 = L.icon({iconUrl: 'wx2.ico', iconSize: [15,15]});

var url_notam = url.concat("SELECT s.coords AS GEOM, n.stn_call, stn_loc, n.rep_num, text_data, start_date,stop_date \
			                FROM sigairmet n LEFT JOIN graphics g ON n.prod_id = g.prod_id AND n.rep_num = g.rep_num \
			                JOIN stations s ON n.stn_call = s.stn_call WHERE n.prod_id = 8");

notam = L.realtime({
	url: url_notam,
	crossOrigin: true, type: 'json'
	}, {interval: 19 * 1000,
		getFeatureId: function(featureData) {
		return featureData.properties.stn_call;
		},
		pointToLayer: function(feature, latlng) {
			marker = L.marker(latlng, {icon: wxIcon2});
	   		marker.bindTooltip('NOTAM' + '<br>' + feature.properties.stn_call);
			marker.on('click', function(e) {
				$("#m1").html("Station");
				$("#m2").html("Location");
				$("#m3").html("Report Num");
				$("#m4").html("Text");
				$("#m5").html("Start");
				$("#m6").html("Stop");
				$('#f1').html(e.target.feature.properties.stn_call + " (NOTAM)");
				$('#f2').html(e.target.feature.properties.stn_loc);
				$('#f3').html(e.target.feature.properties.rep_num);
				$('#f4').html(e.target.feature.properties.text_data);
				$('#f5').html(e.target.feature.properties.start_date);
				$('#f6').html(e.target.feature.properties.stop_date);
			});
			marker.addTo(map);
			return marker;
		}
	}).addTo(map);

// ** TAF
var wxIcon3 = L.icon({iconUrl: 'wx1.ico', iconSize: [15,15]});

var url_taf = url.concat("SELECT coords AS GEOM, t.stn_call, stn_loc, issued, current, wind, visby, condx, rep_time \
			              FROM taf t, stations s WHERE t.stn_call = s.stn_call");

taf = L.realtime({
	url: url_taf,
	crossOrigin: true, type: 'json'
	}, {interval: 14 * 1000,
		getFeatureId: function(featureData) {
		return featureData.properties.stn_call;
		},
		pointToLayer: function(feature, latlng) {
			marker = L.marker(latlng, {icon: wxIcon3});
			marker.bindTooltip('TAF' + '<br>' + feature.properties.stn_call);
			marker.on('click', function(e) {
				$("#m1").html("Station");
				$("#m2").html("Location");
				$("#m3").html("Issued");
				$("#m4").html("Winds");
				$("#m5").html("Visibility");
				$("#m6").html("Conditions");
				$('#f1').html(e.target.feature.properties.stn_call + " (TAF)");
				$('#f2').html(e.target.feature.properties.stn_loc);
				$('#f3').html(e.target.feature.properties.issued + '<br>' + e.target.feature.properties.current);
				$('#f4').html(e.target.feature.properties.wind);
				$('#f5').html(e.target.feature.properties.visby);
				$('#f6').html(e.target.feature.properties.condx);
			});
			marker.addTo(map);
			return marker;
		}
	}).addTo(map);

// ** PIREP
var url_pirep = url.concat("SELECT coords AS GEOM, p.stn_call, stn_loc, rep_type, fl_lev, ac_type, turbulence, remarks, location \
			                FROM pirep p INNER JOIN (SELECT stn_call, MAX(rep_time) AS mx FROM pirep GROUP BY stn_call) g \
			                ON p.stn_call = g.stn_call AND p.rep_time = g.mx INNER JOIN stations s ON p.stn_call = s.stn_call");

var wxIcon4 
pirep = L.realtime({
	url: url_pirep,
	crossOrigin: true, type: 'json'
	}, {interval: 19 * 1060,
		getFeatureId: function(featureData) {
		return featureData.properties.stn_call;
		},
		pointToLayer: function(feature, latlng) {
			if (feature.properties.rep_type == "Urgent Report")
				wxIcon4 = L.icon({iconUrl: 'pilot2.ico', iconSize: [17,17]})
			else
				wxIcon4 = L.icon({iconUrl: 'pilot.ico', iconSize: [15,15]});

			marker = L.marker(latlng, {icon: wxIcon4});

			if (feature.properties.rep_type == "Urgent Report")
				marker.bindTooltip('Urgent PIREP' + '<br>' + feature.properties.stn_call);
			else
				marker.bindTooltip('PIREP' + '<br>' + feature.properties.stn_call);

			marker.on('click', function(e) {
				$("#m1").html("Station");
				$("#m2").html("Location");
				$("#m3").html("Flvl/AC Type");
				$("#m4").html("Turbulence");
				$("#m5").html("Location");
				$("#m6").html("Remarks");
				if (feature.properties.rep_type == "Urgent Report")
					$('#f1').html(e.target.feature.properties.stn_call + " (*Urgent PIREP*)");
				else
					$('#f1').html(e.target.feature.properties.stn_call + " (PIREP)");

				$('#f2').html(e.target.feature.properties.stn_loc);
				$('#f3').html("FL: " + e.target.feature.properties.fl_lev + "  AC: " + e.target.feature.properties.ac_type);
				$('#f4').html(e.target.feature.properties.turbulence);
				$('#f5').html(e.target.feature.properties.location);
				$('#f6').html(e.target.feature.properties.remarks);
			});
			marker.addTo(map);
			return marker;
		}
	}).addTo(map);

// Handles the check boxes being turned on/off
document.querySelector("input[name = gmet]").addEventListener('change', function() {
	if(this.checked) { 
		map.addLayer(gairmet), gairmet.start()}
	else { 
		map.removeLayer(gairmet), gairmet.stop()}
})

document.querySelector("input[name = amet]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(airmet), airmet.start()}
	else {
		map.removeLayer(airmet), airmet.stop()}
})

document.querySelector("input[name = meta]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(metar), metar.start()}
	else {
		map.removeLayer(metar), metar.stop()}
})

document.querySelector("input[name = notam]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(notam), notam.start()}
	else {
		map.removeLayer(notam), notam.stop()}
})

document.querySelector("input[name = taf]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(taf), taf.start()}
	else {
		map.removeLayer(taf), taf.stop()}
})

document.querySelector("input[name = pirep]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(pirep), pirep.start()}
	else {
		map.removeLayer(pirep), pirep.stop()}
})

document.querySelector("input[name = smet]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(sigmet), sigmet.start()}
	else {
		map.removeLayer(sigmet), sigmet.stop()}
})

document.querySelector("input[name = cwa]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(cwa), cwa.start()}
	else {
		map.removeLayer(cwa), cwa.stop()}
})

document.querySelector("input[name = nrad]").addEventListener('change', function() {
	if(this.checked) {
		lays.addLayer(moose),
		map.addLayer(lays); nrad.start()}
	else {
   		lays.clearLayers(),moose.stop()} 
})

document.getElementById("stim").onchange = function()
	{gairmet.update()}		
document.getElementById("gmsliderRange").onchange = function()
	{gairmet.update(),airmet.update(),sigmet.update(),cwa.update()}


//Add layer control
var baseMaps = {
	"Imagery":Esri_WorldImagery,
	"Open Street Map": osm,
	"Gray":Esri_WorldGrayCanvas,
	"OSM B&W":OpenStreetMap_BlackAndWhite
};

var overlayMaps = {};
L.control.layers(baseMaps, overlayMaps).addTo(map);
