window.onload = onPageLoad();

function onPageLoad() {
	document.getElementById("gmet").checked = true;
	document.getElementById("meta").checked = true;
	document.getElementById("amet").checked = true;
	document.getElementById("smet").checked = true;
	document.getElementById("notam").checked = true;
	document.getElementById("taf").checked = true;

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

var serv_port = document.getElementById('port').value;
var url1 = "http://localhost:";

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

var url3_gairmet=url1.concat(serv_port,"/sql?q=select coords as geom,rep_num,alt,ob_ele,start_date,stop_date from graphics where prod_id=14");

var gairmet = L.realtime({
		url: url3_gairmet,
		crossOrigin: true, type: 'json'
	}, {interval: 12 * 1000,
		style: function(feature){
			kolor  = getColor(feature.properties.alt);
			return { color: '#5D8C8C', weight: 2, fillColor: kolor,opacity: 1.0,fillOpacity: 0.2};
		},
			getFeatureId: function(featureData){
				return featureData.properties.rep_num;
		},
 			onEachFeature: function (feature, layer){
				layer.bindTooltip('G-AIRMET: Alt '+ feature.properties.alt);
	           	layer.on('click',function(e){
					layer.setStyle({color: 'yellow',opacity: 0.8, fillColor: 'yellow', fillOpacity: 0.5});
					
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
					if (nn== -1000) return (feature.properties.alt)
						else
					return (feature.properties.alt >= (nn-500) && feature.properties.alt <= (nn +500) );
				}
		}).addTo(map);  

// AIRMET

var url3_airmet=url1.concat(serv_port,"/sql?q=select coords as geom,g.rep_num,alt,ob_ele,text_data,start_date,stop_date \
		from graphics g left join sigairmet s on (g.prod_id=s.prod_id) and (g.rep_num=s.rep_num) where g.prod_id=11");

var	airmet = L.realtime({
		url: url3_airmet,
		crossOrigin: true, type: 'json'
	}, {interval: 19 * 1020,
		style: function(feature){
			kolor  = getColor(feature.properties.alt);
				return { color: '#00cccc', weight: 2, fillColor: kolor,opacity: 1.0,fillOpacity: 0.2};
		},
			getFeatureId: function(featureData){
				return featureData.properties.rep_num;
		},
			onEachFeature: function (feature, layer) 
			{
				layer.bindTooltip('AIRMET: Alt ' + feature.properties.alt);
	           	layer.on('click',function(e){
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
					if (nn== -1000) return (feature.properties.alt)
						else
					return (feature.properties.alt >= (nn-500) && feature.properties.alt <= (nn +500) );
				}
		}).addTo(map);

// SIGMET

var url3_sigmet=url1.concat(serv_port,"/sql?q=select coords as geom,g.rep_num,alt,ob_ele,text_data,start_date,stop_date \
				from graphics g left join sigairmet s on (g.prod_id=s.prod_id) and (g.rep_num=s.rep_num) where  g.prod_id=12");

var	sigmet = L.realtime({
		url: url3_sigmet,
		crossOrigin: true, type: 'json'
	}, {interval: 15 * 1030,
		style: function(feature){
			kolor  = getColor(feature.properties.alt);
				return { color: '#00cccc', weight: 2, fillColor: kolor,opacity: 1.0,fillOpacity: 0.2};
		},
			getFeatureId: function(featureData){
				return featureData.properties.rep_num;
		},
			onEachFeature: function (feature, layer) 
			{
				layer.bindTooltip('SIGMET: alt ' + feature.properties.alt);
	           	layer.on('click',function(e){
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
				filter: function(feature,layer) {   
//					var n = document.getElementById("sgalt").value;
					var rangeslider = document.getElementById("smsliderRange");
					var output = document.getElementById("demo2");
					if (rangeslider.value== -1000) output.innerHTML = "All"
						else output.innerHTML = rangeslider.value;
					var nn = parseInt(rangeslider.value, 10);
					if (nn== -1000) return (feature.properties.alt)
						else
					return (feature.properties.alt >= (nn-500) && feature.properties.alt <= (nn +500) );
				}
		}).addTo(map);  

// Circle

var url3_circle=url1.concat(serv_port,"/sql?q=select bot as geom,start_date,stop_date,rep_num \
				from circles");

var	cir = L.realtime({
		url: url3_circle,
		crossOrigin: true, type: 'json'
	}, {interval: 15 * 1030,
		style: function(feature){
			kolor  = getColor(feature.properties.alt);
				return { color: '#00cccc', weight: 2, fillColor: kolor,opacity: 1.0,fillOpacity: 0.2};
		},
			getFeatureId: function(featureData){
				return featureData.properties.rep_num;
		},
			onEachFeature: function (feature, layer) 
			{
				layer.bindTooltip('CIRC: alt ' + feature.properties.alt);
	           	layer.on('click',function(e){
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
					circ.stop();});
	           layer.on('mouseout',function(e){
					circ.start();})		
			}    //,
//				filter: function(feature,layer) {   
//					var n = document.getElementById("sgalt").value;
//					var rangeslider = document.getElementById("smsliderRange");
//					var output = document.getElementById("demo2");
//					if (rangeslider.value== -1000) output.innerHTML = "All"
//						else output.innerHTML = rangeslider.value;
//					var nn = parseInt(rangeslider.value, 10);
//					if (nn== -1000) return (feature.properties.alt)
//						else
//					return (feature.properties.alt >= (nn-500) && feature.properties.alt <= (nn +500) );
//				}
		}).addTo(map);  



// ** METAR 

var wxIcon = L.icon({iconUrl: 'therm.ico', iconSize: [35,35]});

var url3_metar=url1.concat(serv_port,"/sql?q=select  s.coords as geom,m.stn_call,s.stn_loc,ob_date,temp,windsp,\
winddir,altimeter,visby,dewp from metar m inner join (select stn_call,max(ob_date) as mob from metar group by stn_call) g on m.stn_call=g.stn_call and m.ob_date=g.mob inner join stations s on m.stn_call=s.stn_call");

metar = L.realtime({
		url: url3_metar,
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
 					$("#m1").html("Station");
 					$("#m3").html("Time");
   		    		$("#m4").html("Temp");
   			    	$("#m5").html("Winds");
   			    	$("#m6").html("Visibility");
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

//var url3_notam=url1.concat(serv_port,"/sql?q=select coords as geom,n.stn_call,stn_loc,rep_num,text_data \
//		from sigairmet n, stations s where prod_id=8 and n.stn_call=s.stn_call");

var url3_notam=url1.concat(serv_port,"/sql?q=select s.coords as geom,n.stn_call,stn_loc,n.rep_num,text_data,start_date,stop_date \
		from sigairmet n left join graphics g on n.prod_id=g.prod_id and n.rep_num=g.rep_num join stations s on n.stn_call=s.stn_call where n.prod_id=8");


notam = L.realtime({
		url: url3_notam,
		crossOrigin: true, type: 'json'
	}, {interval: 19 * 1000,
  		getFeatureId: function(featureData) {
			return featureData.properties.stn_call;
		},
		pointToLayer: function (feature, latlng) {
			marker = L.marker(latlng,{icon: wxIcon2});
    		marker.bindTooltip(feature.properties.stn_call);
 			marker.on('click', function (e) {
		 			$("#m1").html("Station");
					$("#m3").html("Report Num");
					$("#m4").html("Text");
					$("#m5").html("Start");
					$("#m6").html("Stop");
					$('#f1').html(e.target.feature.properties.stn_call);
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

var wxIcon3 = L.icon({iconUrl: 'wx1.ico', iconSize: [20,20]});

var url3_taf=url1.concat(serv_port,"/sql?q=select coords as geom,t.stn_call,stn_loc,issued,current,wind,visby,condx,rep_time from taf t, stations s where t.stn_call=s.stn_call");

taf = L.realtime({
		url: url3_taf,
		crossOrigin: true, type: 'json'
	}, {interval: 19 * 1000,
  		getFeatureId: function(featureData) {
			return featureData.properties.stn_call;
		},
		pointToLayer: function (feature, latlng) {
			marker = L.marker(latlng,{icon: wxIcon3});
    		marker.bindTooltip(feature.properties.stn_call);
 			marker.on('click', function (e) {
					$("#m1").html("Station");
					$("#m3").html("Issued");
					$("#m4").html("Winds");
					$("#m5").html("Visibility");
					$("#m6").html("Conditions");
					$('#f1').html(e.target.feature.properties.stn_call);
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

document.querySelector("input[name=taf]").addEventListener('change', function() {
                if(this.checked)  {map.addLayer(taf),taf.start()}
                  else {map.removeLayer(taf),taf.stop()}
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
