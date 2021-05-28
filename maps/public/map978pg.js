var serv_port = document.getElementById('port').value;
var url1 = "http://localhost:";
var url = url1.concat(serv_port, "/sql?q=");
var url3_rad = " ";
var url_nx = " ";
var turblegend;
var icelegend;
var cloudlegend;
var nexlegend;
var rprod = 0;

window.onload = onPageLoad();

function onPageLoad() {
	document.getElementById("gmsliderRange").step = "1000";
	document.getElementById("gmsliderRange").value = "0";
	document.getElementById("altrad").disabled = true;
}

function reloadFunc(obj) {
	location.reload();
}

function right(str, chr) {
	return str.slice(str.length - chr, str.length);
}

var map = L.map('map', {preferCanvas: true}).setView([36.0, -75.26], 5); 

var osm=new L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', { 
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
			colf >=	0	? '#EC8235':
					'blue';
}	

function getNexrad() {
	var rad_prod_str = document.getElementById('prodid').value;
	var rad_alt_str = document.getElementById('altrad').value;
	var rad_prod = parseInt(rad_prod_str);
	var rad_alt = parseInt(rad_alt_str);
	var rad_prodid = 0

	switch(rad_prod) {
		case 0:
		 	rad_prodid = 0;
			rad_alt = 0;
			break;
		case 1:
			nexlegend.addTo(map);
			rad_prodid = 64;
			rad_alt = 0;
			break;
		case 2:
			nexlegend.addTo(map);
			rad_prodid = 63;
			rad_alt = 0;
			break;		
		case 3:
			icelegend.addTo(map);
			if (rad_alt > 16000) 
				rad_prodid = 71;
			else
				rad_prodid = 70;
			break;
		case 4:
			turblegend.addTo(map);
			if (rad_alt > 16000) 
				rad_prodid = 91;
			else
				rad_prodid = 90;
			break;
		case 5:
			cloudlegend.addTo(map);
			rad_prodid = 84;
			rad_alt = 0;
			break;
		case 6:
			lightlegend.addTo(map);
			rad_prodid = 103;
			rad_alt = 0;
			break;
	}

	var rad_pre = `SELECT coords AS GEOM, m.prod_id, m.intensity, m.maptime, m.block_num,seq \
			FROM nexrad m INNER JOIN (SELECT MAX(maptime) AS mob FROM nexrad \
			WHERE prod_id = ${rad_prodid}) g \
			ON m.maptime = g.mob AND m.prod_id = ${rad_prodid} AND altitude = ${rad_alt}`;

	return rad_pre;
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
	}, {interval: 16 * 2000,
		style: function(feature) {
			kolor = getColor(feature.properties.alt);
			return {color: '#5D8C8C', weight: 2, fillColor: kolor, opacity: 1.0, fillOpacity: 0.2};
		},
		getFeatureId: function(featureData) {
			return featureData.properties.rep_num;
		},
		onEachFeature: function(feature, layer) {
			layer.bindTooltip('G-AIRMET: Alt '+ feature.properties.alt + 
				'<br>' + feature.properties.ob_ele);
			layer.on('click', function(e) {
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
			layer.on('mouseout', function(e) {
				gairmet.start();})		
			},
			filter: function(feature, layer) {
				var rangeslider = document.getElementById("gmsliderRange");
				var output = document.getElementById("slidealt");
				if (rangeslider.value == -1000) 
					output.innerHTML = "All"
				else 
					output.innerHTML = rangeslider.value;

				var nn = parseInt(rangeslider.value, 10);
				var e = document.getElementById("stim");
				var stim = e.value;
				if (nn == -1000) 
					return (feature.properties.alt >= 0 && 
						right(feature.properties.start_date, 5) == stim)
				else 
					return (feature.properties.alt >= (nn - 500) && 
						feature.properties.alt <= (nn + 500) && 
						right(feature.properties.start_date, 5) == stim);
			}
		}).addTo(map);

// AIRMET
var url_airmet = url.concat("SELECT coords AS GEOM, g.rep_num, alt, ob_ele, text_data, \
					start_date, stop_date \
					FROM graphics g LEFT JOIN sigairmet s ON (g.prod_id = s.prod_id) \
					AND (g.rep_num = s.rep_num) WHERE g.prod_id = 11");

var	airmet = L.realtime({
	url: url_airmet,
	crossOrigin: true, type: 'json'
	}, {interval: 19 * 2020,
		style: function(feature) {
			kolor = getColor(feature.properties.alt);
			return {color: '#00cccc', weight: 2, fillColor: kolor, opacity: 1.0, fillOpacity: 0.2};
		},
		getFeatureId: function(featureData) {
			return featureData.properties.rep_num;
		},
		onEachFeature: function(feature, layer) {
			layer.bindTooltip('AIRMET: Alt ' + feature.properties.alt);
			layer.on('click', function(e) {
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
			layer.on('mouseout', function(e) {
				airmet.start();})		
			},
			filter: function(feature, layer) {
				var rangeslider = document.getElementById("gmsliderRange");
				var output = document.getElementById("slidealt");
				if (rangeslider.value == -1000) 
					output.innerHTML = "All"
				else 
					output.innerHTML = rangeslider.value;

				var nn = parseInt(rangeslider.value, 10);
				if (nn == -1000) 
					return (feature.properties.alt >= 0)
				else 
					return (feature.properties.alt >= (nn - 500) &&
						feature.properties.alt <= (nn + 500));
			}
		}).addTo(map);

// SIGMET
var url_sigmet = url.concat("SELECT coords AS GEOM, g.rep_num, alt, ob_ele, text_data, \
					start_date, stop_date \
					FROM graphics g LEFT JOIN sigairmet s ON (g.prod_id = s.prod_id) AND \
					(g.rep_num = s.rep_num)	WHERE g.prod_id = 12");

var	sigmet = L.realtime({
	url: url_sigmet,
	crossOrigin: true, type: 'json'
	}, {interval: 25 * 3030,
		style: function(feature) {
			kolor = getColor(feature.properties.alt);
			return {color: '#00cccc', weight: 2, fillColor: kolor, opacity: 1.0, fillOpacity: 0.2};
		},
		getFeatureId: function(featureData) {
			return featureData.properties.rep_num;
		},
		onEachFeature: function(feature, layer) {
			layer.bindTooltip('SIGMET: Alt ' + feature.properties.alt);
			layer.on('click', function(e) {
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
			layer.on('mouseout', function(e) {
				sigmet.start();})		
			},
			filter: function(feature, layer) {
				var rangeslider = document.getElementById("gmsliderRange");
				var output = document.getElementById("slidealt");
				if (rangeslider.value == -1000)
					output.innerHTML = "All"
				else 
					output.innerHTML = rangeslider.value;

				var nn = parseInt(rangeslider.value, 10);
				if (nn == -1000) 
					return (feature.properties.alt >= 0)
				else 
					return (feature.properties.alt >= (nn - 500) &&
						feature.properties.alt <= (nn + 500));
			}
		}).addTo(map);

// NEXRAD
var radar;
	url_nx = getNexrad();
	url3_rad = url.concat(url_nx);

var lays = new L.FeatureGroup();
var	nrad = L.realtime({
	url: url3_rad,
 	crossOrigin: true, type: 'json'
	}, {interval: 55 * 1000,

	getFeatureId: function(featureData) {
	return featureData.properties.seq;
	},

	style: function(feature) {
		if (feature.properties.prod_id == 84 || feature.properties.prod_id == 90 || feature.properties.prod_id == 91 ) {
// if (feature.properties.prod_id == 84 ) {
			golor = getColorInt(feature.properties.intensity);
			return {color: golor, weight: 4, fillColor: golor, opacity: 0.5, fillOpacity: 0.5}
		}
	},

	pointToLayer: function(feature, latlng) {
		if (feature.properties.prod_id != 84 ) {		
			var currentPoint = map.latLngToContainerPoint(latlng);
			var width = 5;		//5
			var height = 5;		//5
			var xDifference = width / 2;
			var yDifference = height / 2;
			var southWest = L.point((currentPoint.x - xDifference), (currentPoint.y - yDifference));
			var northEast = L.point((currentPoint.x + xDifference), (currentPoint.y + yDifference));
			var bounds = L.latLngBounds(map.containerPointToLatLng(southWest),
				map.containerPointToLatLng(northEast));

			golor = getColorInt(feature.properties.intensity);
			var rectOptions = {fillColor: golor, fillOpacity: 0.2, weight: 0}
			radar = L.rectangle(bounds, rectOptions); 

			lays.addLayer(radar);
			map.addLayer(lays);
			nrad.stop();
		};
	}
}).addTo(map)

// CWA
var url3_cwa = url.concat("SELECT coords AS GEOM, g.rep_num, alt, ob_ele, text_data, \
					start_date, stop_date \
					FROM graphics g LEFT JOIN sigairmet s ON (g.prod_id = s.prod_id) AND \
					(g.rep_num = s.rep_num) WHERE g.prod_id = 15");

var	cwa = L.realtime({
	url: url3_cwa,
	crossOrigin: true, type: 'json'
	}, {interval: 50 * 9000,
		style: function(feature) {
			kolor = getColor(feature.properties.alt);
			return {color: '#00cccc', weight: 2, fillColor: kolor, opacity: 1.0, fillOpacity: 0.2};
		},
		getFeatureId: function(featureData) {
			return featureData.properties.rep_num;
		},
		onEachFeature: function(feature, layer) {
			layer.bindTooltip('CWA: Alt ' + feature.properties.alt);
			layer.on('click', function(e) {
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
			layer.on('mouseout', function(e) {
				cwa.start();})		
			},
			filter: function(feature,layer) {
				var rangeslider = document.getElementById("gmsliderRange");
				var output = document.getElementById("slidealt");
				if (rangeslider.value == -1000)
					output.innerHTML = "All"
				else 
					output.innerHTML = rangeslider.value;

				var nn = parseInt(rangeslider.value, 10);
				if (nn == -1000) 
					return (feature.properties.alt >= 0)
				else 
					return (feature.properties.alt >= (nn - 500) &&
						feature.properties.alt <= (nn + 500));
			}
		}).addTo(map);

// SUA
var url3_sua = url.concat("SELECT s.airsp_id, rep_time, s.airsp_name, sua_airsp_desc, \
					sua_status_desc, start_time, end_time, high_alt, low_alt, \
					coords AS GEOM, dafif_name, sep_rule, shape_ind \
					FROM sua s INNER JOIN sua_airspace a ON a.airsp_id = s.airsp_id \
					INNER JOIN sua_airspace_type t ON t.sua_airsp_type = s.airsp_type \
					INNER JOIN sua_sched_status c ON c.sua_status = s.sched_status");

var sk = document.getElementById("sua")

var	sua = L.realtime({
	url: url3_sua,
	crossOrigin: true, type: 'json'
	}, {interval: 50 * 1000,
		style: function(feature) {
			return {color: '#2e052a', weight: 3, fillColor: '#2e052a', opacity: 0.5, fillOpacity: 0.5};
		},
		getFeatureId: function(featureData) {
			return featureData.properties.airsp_name;
		},
		onEachFeature: function(feature, layer) {
			layer.bindTooltip('SUA: ' + feature.properties.airsp_name);
			layer.on('mouseover', function(e) {
				layer.setStyle({color: 'yellow', fillColor: 'yellow', fillOpacity: 0.5});

				$("#m1").html("Report");
				$("#m2").html("Status");					
				$("#m3").html("Times");
				$("#m4").html("Altitudes L/H");
				$("#m5").html("Sep/shape");
				$("#m6").html("DAFIF");
					
				$('#f1').html('SUA - ' + e.target.feature.properties.airsp_name);
				$('#f2').html(e.target.feature.properties.sua_airsp_desc + ' <br>' +
					e.target.feature.properties.sua_status_desc);
				$('#f3').html(e.target.feature.properties.start_time + ' <br>' +
					e.target.feature.properties.end_time);
				$('#f4').html(e.target.feature.properties.low_alt +
					' <br>' + e.target.feature.properties.high_alt);
				$('#f5').html(e.target.feature.properties.sep_rule + '  ' +
					e.target.feature.properties.shape_ind);
				$('#f6').html(e.target.feature.properties.dafif_name);

				sua.stop();});
				
				layer.on('mouseout', function(e) {
					sua.start();});

				if (!sk.checked){
					map.removeLayer(sua), sua.stop()
				}		
			},
		}).addTo(map);

	if (!sk.checked){
		map.removeLayer(sua), sua.stop()
	}

// ** Circle

var url_circle = url.concat("SELECT bot AS GEOM, c.start_date, c.stop_date, c.rep_num, c.r_lng, \
c.r_lat, c.alt_top, c.alt_bot, c.alpha,s.text_data FROM circles c \
left join sigairmet s on s.rep_num = c.rep_num");

var	cir = L.realtime({
	url: url_circle,
	crossOrigin: true, type: 'json'
	}, {interval: 6 * 7030,
		getFeatureId: function(featureData) {
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
 				$("#m6").html("Text ");
				$('#f1').html('Bottom ' + e.target.feature.properties.alt_bot + 'ft<br> Top ' +
					e.target.feature.properties.alt_top + 'ft');
				$('#f2').html('Lat: ' + e.target.feature.properties.r_lat + ' Lng: ' +
					e.target.feature.properties.r_lat + ' Alpha: ' + e.target.feature.properties.alpha);
				$('#f3').html(e.target.feature.properties.rep_num);
				$('#f4').html(e.target.feature.properties.start_date);
				$('#f5').html(e.target.feature.properties.stop_date);
				$('#f6').html(e.target.feature.properties.text_data);
			});
			marker.addTo(map);
			return marker;
		}
	}).addTo(map);

// ** METAR 
var wxIcon = L.icon({iconUrl: 'therm.ico', iconSize: [20,20]});

var url_metar = url.concat("SELECT s.coords AS GEOM, m.stn_call, s.stn_loc, ob_date, temp, windsp, \
					winddir, altimeter, visby, dewp, hrly_precip, slp, windvar, windgust \
					FROM metar m INNER JOIN (SELECT stn_call, MAX(ob_date) AS mob FROM metar \
					GROUP BY stn_call) g ON m.stn_call = g.stn_call AND m.ob_date = g.mob \
					INNER JOIN stations s ON m.stn_call = s.stn_call");

var mk = document.getElementById("meta")

metar = L.realtime({
	url: url_metar,
	crossOrigin: true, type: 'json'
	}, {interval: 17 * 2002,
		getFeatureId: function(featureData) {
		return featureData.properties.stn_call;
		},
		pointToLayer: function(feature, latlng) {
			marker = L.marker(latlng, {icon: wxIcon});
			marker.bindTooltip('METAR' + '<br>' + feature.properties.stn_call
				+ '<br>' + feature.properties.temp + '&#x2109');
			marker.on('click', function(e) {
				$("#m1").html("Station" );
				$("#m2").html("Location");
				$("#m3").html("Temp");
				$("#m4").html("Winds");
				$("#m5").html("Visibility");
				$("#m6").html("Pressure");
				$('#f1').html(e.target.feature.properties.stn_call + " - " +
								e.target.feature.properties.ob_date + 'z');
				$('#f2').html(e.target.feature.properties.stn_loc);
				$('#f3').html(e.target.feature.properties.temp + "\xB0F" +
						"  dp:" + e.target.feature.properties.dewp +
						"\xB0F<br> Hrly Precip:" +
						e.target.feature.properties.hrly_precip);
				$('#f4').html(e.target.feature.properties.windsp + "kts " +
						e.target.feature.properties.winddir + "° " +
						e.target.feature.properties.windvar + "  gusts:" +
						e.target.feature.properties.windgust + "kts");
				$('#f5').html(e.target.feature.properties.visby);
				$('#f6').html("SLP:" + e.target.feature.properties.slp +
					"<br>Altimeter:" + e.target.feature.properties.altimeter );
			});
			marker.addTo(map);
			
			if (!mk.checked){
				map.removeLayer(marker), metar.stop()
			}
			return marker;
		}
	}).addTo(map);
	
	if (!mk.checked){
		map.removeLayer(metar), metar.stop()
	}

// ** NOTAM
var wxIcon2 = L.icon({iconUrl: 'wx2.ico', iconSize: [15,15]});

var url_notam = url.concat("SELECT s.coords AS GEOM, n.stn_call, stn_loc, n.rep_num, text_data, \
					start_date, stop_date \
					FROM sigairmet n LEFT JOIN graphics g ON n.prod_id = g.prod_id \
					AND n.rep_num = g.rep_num \
					JOIN stations s ON n.stn_call = s.stn_call WHERE n.prod_id = 8");

var nk = document.getElementById("notam")

notam = L.realtime({
	url: url_notam,
	crossOrigin: true, type: 'json'
	}, {interval: 19 * 2004,
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

			if (!nk.checked){
				map.removeLayer(marker), notam.stop()
			}

			return marker;
		}
	}).addTo(map);

	if (!nk.checked){
		map.removeLayer(notam), notam.stop()
	}
	
// ** TAF
var wxIcon3 = L.icon({iconUrl: 'wx1.ico', iconSize: [15,15]});

var url_taf = url.concat("SELECT coords AS GEOM, t.stn_call, stn_loc, issued, current, \
					wind, visby, condx, rep_time \
					FROM taf t, stations s WHERE t.stn_call = s.stn_call");

var tk = document.getElementById("taf")

taf = L.realtime({
	url: url_taf,
	crossOrigin: true, type: 'json'
	}, {interval: 14 * 2005,
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
				$('#f3').html(e.target.feature.properties.issued + '<br>' +
					e.target.feature.properties.current);
				$('#f4').html(e.target.feature.properties.wind);
				$('#f5').html(e.target.feature.properties.visby);
				$('#f6').html(e.target.feature.properties.condx);
			});
			marker.addTo(map);

			if (!tk.checked){
				map.removeLayer(marker), taf.stop()
			}

			return marker;
		}
	}).addTo(map);
	
	if (!nk.checked){
		map.removeLayer(taf), taf.stop()
	}

// ** Winds Aloft
var url_winds = url.concat("SELECT coords AS GEOM, w.stn_call, stn_loc, issue_date, alt1, \
					dir1, spd1, temp1, alt2, dir2, spd2, temp2, alt3, dir3, spd3, temp3, alt4, \
					dir4, spd4, temp4, alt5, dir5, spd5, temp5, alt6, dir6, spd6, temp6, alt7, \
					dir7, spd7, temp7, alt8, dir8, spd8, temp8, alt9, dir9, spd9, temp9 \
					FROM winds w INNER JOIN (SELECT stn_call, MAX(proc_time) AS mx FROM winds \
					GROUP BY stn_call) g ON w.stn_call = g.stn_call AND w.proc_time = g.mx \
					INNER JOIN stations s ON w.stn_call = s.stn_call");

var wxIcon5 = L.icon({iconUrl: 'wind.ico', iconSize: [15,15]});

var wk = document.getElementById("winds")
 
winds = L.realtime({
	url: url_winds,
	crossOrigin: true, type: 'json'
	}, {interval: 19 * 3060,
		getFeatureId: function(featureData) {
		return featureData.properties.stn_call;
		},
		pointToLayer: function(feature, latlng) {
			marker = L.marker(latlng, {icon: wxIcon5});

			marker.bindTooltip('Winds' + '<br>' + feature.properties.stn_call);

			marker.on('click', function(e) {
				$("#m1").html("Station" + '<br>' + e.target.feature.properties.issue_date );
				$("#m2").html(e.target.feature.properties.alt1 + "ft" + '<br>' +
					e.target.feature.properties.alt2 + "ft");
				$("#m3").html(e.target.feature.properties.alt3 + "ft" + '<br>' +
					e.target.feature.properties.alt4 + "ft");
				$("#m4").html(e.target.feature.properties.alt5 + "ft" + '<br>' +
					e.target.feature.properties.alt6 + "ft");
				$("#m5").html(e.target.feature.properties.alt7 + "ft" + '<br>' +
					e.target.feature.properties.alt8 + "ft");
				$("#m6").html(e.target.feature.properties.alt9 + "ft");
				$('#f1').html(e.target.feature.properties.stn_call + " (Winds)" +
					'<br>' + e.target.feature.properties.stn_loc);
				$('#f2').html(e.target.feature.properties.dir1 + "\xB0 " +
					e.target.feature.properties.spd1 + "kt " +
					e.target.feature.properties.temp1 + "\xB0C" +
					'<br>' + e.target.feature.properties.dir2 + "\xB0 " +
					e.target.feature.properties.spd2 + "kt " +
					e.target.feature.properties.temp2 + "\xB0C");
				$('#f3').html(e.target.feature.properties.dir3 + "\xB0 " +
					e.target.feature.properties.spd3 + "kt " +
					e.target.feature.properties.temp3 + "\xB0C" +
					'<br>' + e.target.feature.properties.dir4 + "\xB0 " +
					e.target.feature.properties.spd4 + "kt " +
					e.target.feature.properties.temp4 + "\xB0C");	
				$('#f4').html(e.target.feature.properties.dir5 + "\xB0 " +
					e.target.feature.properties.spd5 + "kt " +
					e.target.feature.properties.temp5 + "\xB0C"	+ '<br>' +
					e.target.feature.properties.dir6 + "\xB0 " +
					e.target.feature.properties.spd6 + "kt " +
					e.target.feature.properties.temp6 + "\xB0C");
				$('#f5').html(e.target.feature.properties.dir7 + "\xB0 " +
					e.target.feature.properties.spd7 + "kt " +
					e.target.feature.properties.temp7 + "\xB0C"	+ '<br>' +
					e.target.feature.properties.dir8 + "\xB0 " +
					e.target.feature.properties.spd8 + "kt " +
					e.target.feature.properties.temp8 + "\xB0C");
				$('#f6').html(e.target.feature.properties.dir9 + "\xB0 " +
					e.target.feature.properties.spd9 + "kt " +
					e.target.feature.properties.temp9 + "\xB0C");
			});
			marker.addTo(map);

			if (!wk.checked){
				map.removeLayer(marker), winds.stop()
			}

			return marker;
		}
	}).addTo(map);
	
	if (!wk.checked){
		map.removeLayer(winds), winds.stop()
	}

// ** PIREP
var url_pirep = url.concat("SELECT coords AS GEOM, p.stn_call, stn_loc, rep_type, fl_lev, \
					ac_type, turbulence, remarks, location, cloud, weather, temperature, \
					wind_spd_dir, icing, rep_time \
					FROM pirep p INNER JOIN (SELECT stn_call, MAX(rep_time) AS mx FROM pirep \
					GROUP BY stn_call) g ON p.stn_call = g.stn_call AND p.rep_time = g.mx \
					INNER JOIN stations s ON p.stn_call = s.stn_call");

var wxIcon4 
var pk = document.getElementById("pirep")

pirep = L.realtime({
	url: url_pirep,
	crossOrigin: true, type: 'json'
	}, {interval: 19 * 3060,
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
				$("#m2").html("Location" + '<br>' + "Time: " + 
					e.target.feature.properties.rep_time + "z");
				$("#m3").html("Flt Lev:" + '<br>' + "AC Type:");
				$("#m4").html("Turbulence:" + '<br>' + "Icing:");
				$("#m5").html("WX");
				$("#m6").html("Remarks");
				if (feature.properties.rep_type == "Urgent Report")
					$('#f1').html(e.target.feature.properties.stn_call + " (*Urgent PIREP*)");
				else
					$('#f1').html(e.target.feature.properties.stn_call + " (PIREP)");

				$('#f2').html(e.target.feature.properties.stn_loc + "<br><i>Loc: "
					+ e.target.feature.properties.location);
				$('#f3').html("<i>Flt lev: " + e.target.feature.properties.fl_lev +
					"<br><i>a/c: " + e.target.feature.properties.ac_type);
				$('#f4').html("<i>Turb: " + e.target.feature.properties.turbulence +
					"<br><i>Ice: " + e.target.feature.properties.icing);
				$('#f5').html("<i>Cloud: " +e.target.feature.properties.cloud +
					"<br><i>Temp: " + e.target.feature.properties.temperature +
					"<br><i>Wind: " + e.target.feature.properties.wind_spd_dir +
					"<br><i>WX: " + e.target.feature.properties.weather);
				$('#f6').html(e.target.feature.properties.remarks);
			});
			marker.addTo(map);
			
			if (!pk.checked){
				map.removeLayer(marker), pirep.stop()
			}

			return marker;
		}
	}).addTo(map);

	if (!pk.checked){
		map.removeLayer(pirep), pirep.stop()
	}

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

document.querySelector("input[name = sua]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(sua), sua.start()}
	else {
		map.removeLayer(sua), sua.stop()}
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

document.querySelector("input[name = winds]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(winds), winds.start()}
	else {
		map.removeLayer(winds), winds.stop()}
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

document.getElementById("stim").onchange = function()
	{gairmet.update()}		
		
document.getElementById("altrad").onchange = function()
	{lays.clearLayers();
		url_nx = getNexrad();
		url3_rad = url.concat(url_nx);
		nrad.setUrl(url3_rad);
		lays.addLayer(radar);
		map.addLayer(lays)}	

document.getElementById("gmsliderRange").onchange = function()
	{gairmet.update(), airmet.update(), sigmet.update(), cwa.update()}

document.getElementById("prodid").onchange = function() {
	var rprod_str = document.getElementById('prodid').value;
	rprod = parseInt(rprod_str);
	map.removeControl(nexlegend);
	map.removeControl(turblegend);
	map.removeControl(icelegend);
	map.removeControl(lightlegend);
	map.removeControl(cloudlegend);

	switch(rprod) {
		case 0:
			document.getElementById("altrad").disabled = true;
			break;
		case 1:
			document.getElementById("altrad").disabled = true;
			break;
		case 2:
			document.getElementById("altrad").disabled = true;
			break;		
		case 3:
			document.getElementById("altrad").disabled = false;
			break;
		case 4:
			document.getElementById("altrad").disabled = false;
			break;
		case 5:
			document.getElementById("altrad").disabled = true;
			break;
		case 6:
			document.getElementById("altrad").disabled = true;
			break;
	}
	lays.clearLayers();
		url_nx = getNexrad();
		url3_rad = url.concat(url_nx);
		nrad.setUrl(url3_rad);
		lays.addLayer(radar);
		map.addLayer(lays)
}

// Map legends

turblegend = L.control({ position: "topright" });

turblegend.onAdd = function(mop) {
	var div = L.DomUtil.create("div", "legend");
	div.innerHTML += "<h4>Turbulence</h4>";
	div.innerHTML += '<i style="background: #8C8C74"></i><span>EDR  7-13</span><br>';
	div.innerHTML += '<i style="background: #B4C8FF"></i><span>EDR 14-20</span><br>';
	div.innerHTML += '<i style="background: #5F87FF"></i><span>EDR 21-27</span><br>';
	div.innerHTML += '<i style="background: #1446E6"></i><span>EDR 28-34</span><br>';
	div.innerHTML += '<i style="background: #6EF54B"></i><span>EDR 35-41</span><br>';
	div.innerHTML += '<i style="background: #00C300"></i><span>EDR 42-48</span><br>';
	div.innerHTML += '<i style="background: #007300"></i><span>EDR 49-55</span><br>';
	div.innerHTML += '<i style="background: #FFFF00"></i><span>EDR 56-62</span><br>';
	div.innerHTML += '<i style="background: #FFB430"></i><span>EDR 63-69</span><br>';
	div.innerHTML += '<i style="background: #FA7D00"></i><span>EDR 70-76</span><br>';
	div.innerHTML += '<i style="background: #E62D00"></i><span>EDR 77-83</span><br>';
	div.innerHTML += '<i style="background: #AF0000"></i><span>EDR 84-90</span><br>';
	div.innerHTML += '<i style="background: #690000"></i><span>EDR 91-97</span><br>';
	div.innerHTML += '<i style="background: #FA00C8"></i><span>EDR >=98</span><br>';
	div.innerHTML += '<i style="background: #9B00FA"></i><span>EDR No Data</span><br>';
	return div;
};

cloudlegend = L.control({ position: "topright" });

cloudlegend.onAdd = function(mop) {
	var div = L.DomUtil.create("div", "legend");
	div.innerHTML += "<h4>Cloud Tops</h4>";
	div.innerHTML += '<i style="background: #8C8C74"></i><span><= 1,500ft</span><br>';
	div.innerHTML += '<i style="background: #B4C8FF"></i><span>1,501ft-3,000ft</span><br>';
	div.innerHTML += '<i style="background: #5F87FF"></i><span>3,001ft-4,500ft</span><br>';
	div.innerHTML += '<i style="background: #1446E6"></i><span>4,501ft-6,00ft</span><br>';
	div.innerHTML += '<i style="background: #6EF54B"></i><span>6,001ft-7,500ft</span><br>';
	div.innerHTML += '<i style="background: #00C300"></i><span>7,501ft-9,000ft</span><br>';
	div.innerHTML += '<i style="background: #007300"></i><span>9,001ft-10,500ft</span><br>';
	div.innerHTML += '<i style="background: #FFFF00"></i><span>10,501ft-12,000ft</span><br>';
	div.innerHTML += '<i style="background: #FFB430"></i><span>12,001ft-13,500ft</span><br>';
	div.innerHTML += '<i style="background: #FA7D00"></i><span>13,501ft-15,000ft</span><br>';
	div.innerHTML += '<i style="background: #E62D00"></i><span>15,001ft-18,000ft</span><br>';
	div.innerHTML += '<i style="background: #AF0000"></i><span>18,001ft-21,000ft</span><br>';
	div.innerHTML += '<i style="background: #690000"></i><span>21,001ft-24,000ft</span><br>';
	div.innerHTML += '<i style="background: #FA00C8"></i><span>>24,000ft</span><br>';
	div.innerHTML += '<i style="background: #9B00FA"></i><span>No Data</span><br>';
	return div;
};

icelegend = L.control({ position: "topright" });

icelegend.onAdd = function(mop) {
	var div = L.DomUtil.create("div", "legend");
	div.innerHTML += "<h4>Icing</h4>";
	div.innerHTML += '<i style="background: #8C8C74"></i><span>Trace</span><br>';
	div.innerHTML += '<i style="background: #B4C8FF"></i><span>Light</span><br>';
	div.innerHTML += '<i style="background: #5F87FF"></i><span>Moderate</span><br>';
	div.innerHTML += '<i style="background: #1446E6"></i><span>Severe</span><br>';
	div.innerHTML += '<i style="background: #6EF54B"></i><span>Heavy</span><br>';
	div.innerHTML += '<i style="background: #00C300"></i><span>Reserved</span><br>';
	div.innerHTML += '<i style="background: #007300"></i><span>No Data</span><br>';
	return div;
};

lightlegend = L.control({ position: "topright" });

lightlegend.onAdd = function(mop) {
	var div = L.DomUtil.create("div", "legend");
	div.innerHTML += "<h4>Lightning</h4>";
	div.innerHTML += '<i style="background: #8C8C74"></i><span>1 Strike</span><br>';
	div.innerHTML += '<i style="background: #B4C8FF"></i><span>2 Strikes</span><br>';
	div.innerHTML += '<i style="background: #5F87FF"></i><span>3-5 Strikes</span><br>';
	div.innerHTML += '<i style="background: #1446E6"></i><span>6-10 Strikes</span><br>';
	div.innerHTML += '<i style="background: #6EF54B"></i><span>11-15 Strikes</span><br>';
	div.innerHTML += '<i style="background: #00C300"></i><span>>15 Strikes</span><br>';
	div.innerHTML += '<i style="background: #007300"></i><span>No Data</span><br>';
	return div;
};

nexlegend = L.control({ position: "topright" });

nexlegend.onAdd = function(mop) {
	var div = L.DomUtil.create("div", "legend");
	div.innerHTML += "<h4>NEXRAD</h4>";
	div.innerHTML += '<i style="background: #8C8C74"></i><span>None</span><br>';
	div.innerHTML += '<i style="background: #B4C8FF"></i><span>Light</span><br>';
	div.innerHTML += '<i style="background: #5F87FF"></i><span>Light to Moderate</span><br>';
	div.innerHTML += '<i style="background: #1446E6"></i><span>Moderate to Heavy</span><br>';
	div.innerHTML += '<i style="background: #6EF54B"></i><span>Heavy</span><br>';
	div.innerHTML += '<i style="background: #00C300"></i><span>Very Heavy</span><br>';
	div.innerHTML += '<i style="background: #007300"></i><span>Very Heavy+Hail</span><br>';
	return div;
};

// Add layer control
var baseMaps = {
	"Imagery":Esri_WorldImagery,
	"Open Street Map": osm,
	"Gray":Esri_WorldGrayCanvas,
	"OSM B&W":OpenStreetMap_BlackAndWhite
};

var overlayMaps = {};
L.control.layers(baseMaps, overlayMaps).addTo(map);
