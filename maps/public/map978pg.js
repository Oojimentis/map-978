// ** Map978 Home Sceen.

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sql?q=");
var url_nexrad = " ";
var nexrad_sql = " ";
var turblegend;
var icelegend;
var cloudlegend;
var nexlegend;
var sua_object = [];
var airmet_object = [];
var sigmet_object = [];
var myCustomColour

var popupOptions = {
	'className' : 'custompopup',
	'closeButton' : false
}

window.onload = onPageLoad();

function onPageLoad() {
	document.getElementById("gmsliderRange").step = "1000";
	document.getElementById("gmsliderRange").value = "-1000";
	document.getElementById("altrad").disabled = true;
}

var formValues = JSON.parse(localStorage.getItem('formValues')) || {};
var $checkboxez = $("#ckboxes :checkbox");

function separator(numb) {
	var str = numb.toString().split(".");
	str[0] = str[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");

	return str.join(".");
}

function popup(mylink, windowname) {
	if (! window.focus)return true;
		var href;
	if (typeof(mylink) == 'string') href=mylink;
		else href=mylink.href;

	window.open(href, windowname, 'width=750,height=400,scrollbars=yes');
	return false;
}

function sua_overlap(_sua_object, i) {
	$('#f1').html('SUA - ' + this.sua_object[i].airsp_name);
	$('#f2').html(this.sua_object[i].sua_airsp_desc + ' <br>'
		+ this.sua_object[i].sched_status_desc);
	$('#f3').html(this.sua_object[i].start_time + ' <br>'
		+ this.sua_object[i].end_time);
	$('#f4').html(this.sua_object[i].low_alt + ' <br>'
		+ this.sua_object[i].high_alt);
	$('#f5').html(this.sua_object[i].sep_rule + '  '
		+ this.sua_object[i].shape_ind);
	$('#f6').html(this.sua_object[i].dafif_name);
};

function airmet_overlap(_airmet_object, i) {
	map.removeLayer(airmet);
	map.addLayer(airmet);
	map.eachLayer(function(layer) {
		if (layer._leaflet_id == this.airmet_object[i]._leaflet_id) {

			layer.setStyle({fillColor: 'yellow', fillOpacity: 0.5});

			$('#f1').html('AIRMET');
			$('#f2').html(separator(this.airmet_object[i].feature.properties.alt + 'ft'));
			$('#f3').html(this.airmet_object[i].feature.properties.rep_num);
			$('#f4').html(this.airmet_object[i].feature.properties.text_data);
			$('#f5').html(this.airmet_object[i].feature.properties.start_date);
			$('#f6').html(this.airmet_object[i].feature.properties.stop_date);
		}
	});
};

function sigmet_overlap(_sigmet_object, i) {
	map.removeLayer(sigmet);
	map.addLayer(sigmet);
	map.eachLayer(function(layer) {
		if (layer._leaflet_id == this.sigmet_object[i]._leaflet_id) {

			layer.setStyle({fillColor: 'yellow', fillOpacity: 0.5});

			$('#f1').html('SIGMET');
			$('#f2').html(separator(this.sigmet_object[i].feature.properties.alt) + 'ft');
			$('#f3').html(this.sigmet_object[i].feature.properties.rep_num);
			$('#f4').html(this.sigmet_object[i].feature.properties.text_data);
			$('#f5').html(this.sigmet_object[i].feature.properties.start_date);
			$('#f6').html(this.sigmet_object[i].feature.properties.stop_date);
		}
	});
};

function updateStorage() {
	$checkboxez.each(function() {
		formValues[this.id] = this.checked;
	});

	localStorage.setItem("formValues", JSON.stringify(formValues));
}

$checkboxez.on("change", function() {
	updateStorage();
});

// On page load
$.each(formValues, function(key, value) {
	$("#" + key).prop('checked', value);
});

function right(str, chr) {
	return str.slice(str.length - chr, str.length);
}

var map = L.map('map', {preferCanvas: true}).setView([40.0, -75.26], 7);

// ** Map Layers
var osm=new L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', { 
	attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'});
var Esri_WorldImagery = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
	attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community'
});
var Esri_WorldGrayCanvas = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}', {
	attribution: 'Tiles &copy; Esri &mdash; Esri, DeLorme, NAVTEQ', maxZoom: 16
}).addTo(map);
var OpenStreetMap_BlackAndWhite = L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
	maxZoom: 18,
	attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
});

//** Altitude colours
function getColor(alt_color) {
	return	alt_color >=	60000	? '#67BDE9':
			alt_color >=	50000	? '#6EBAE0':
			alt_color >=	43000	? '#75B7D6':
			alt_color >=	42000	? '#7CB4CD':
			alt_color >=	40000	? '#83B1C3':
			alt_color >=	32000	? '#8AADBA':
			alt_color >=	24000	? '#91AAB0':
			alt_color >=	22000	? '#98A7A7':
			alt_color >=	20000	? '#9FA49D':
			alt_color >=	18000	? '#A6A194':
			alt_color >=	16000	? '#AD9E8A':
			alt_color >=	12000	? '#B49B81':
			alt_color >=	10000	? '#BB9877':
			alt_color >=	9000	? '#C2956E':
			alt_color >=	8000	? '#C99264':
			alt_color >=	7000	? '#D08E5B':
			alt_color >=	6000	? '#D78B51':
			alt_color >=	4000	? '#DE8848':
			alt_color >=	1000	? '#E5853E':
			alt_color >=	0		? '#EC8235':
					'blue';
}
// METAR temperature colours
function getTempColor(alt_color) {
	return 	alt_color >=	100	?'#FF0EF0':
			alt_color >=	95	?'#FF00E0':
			alt_color >=	90	?'#FF00B0':
			alt_color >=	85	?'#FF0050':
			alt_color >=	80	?'#FF3c00':
			alt_color >=	75	?'#FF6400':
			alt_color >=	70	?'#FF8c00':
			alt_color >=	65	?'#FFaa00':
			alt_color >=	60	?'#FFbe00':
			alt_color >=	55	?'#FFd200':
			alt_color >=	50	?'#FFf000':
			alt_color >=	45	?'#b0ff00':
			alt_color >=	40	?'#3eff00':
			alt_color >=	35	?'#00ff5c':
			alt_color >=	30	?'#00ffd0':
			alt_color >=	25	?'#00e4ff':
			alt_color >=	20	?'#00b4ff':
			alt_color >=	15	?'#0084ff':
			alt_color >=	10	?'#0044ff':
			alt_color >=	0	?'#0500ff':
					'white';
}

function getNexrad() {
	var nexrad_prod_str = document.getElementById('prodid').value;
	var nexrad_alt_str = document.getElementById('altrad').value;
	var nexrad_prod = parseInt(nexrad_prod_str);
	var nexrad_alt = parseInt(nexrad_alt_str);
	var nexrad_prodid = 0

	$("#m1").html("-");
	$("#m2").html("-");
	$("#m3").html("-");
	$("#m4").html("-");
	$("#m5").html("-");
	$("#m6").html("-");
	$('#f1').html('-');
	$('#f2').html('-');
	$('#f3').html('-');
	$('#f4').html('-');
	$('#f5').html('-');
	$('#f6').html('-');			

	switch(nexrad_prod) {
	case 0:
		nexrad_prodid = 0;
		nexrad_alt = 0;
		break;
	case 1:
		nexlegend.addTo(map);
		nexrad_prodid = 64;
		nexrad_alt = 0;
		break;
	case 2:
		nexlegend.addTo(map);
		nexrad_prodid = 63;
		nexrad_alt = 0;
		break;
	case 3:
		icelegend.addTo(map);
		if (nexrad_alt > 16000) 
			nexrad_prodid = 71;
		else
			nexrad_prodid = 70;
		break;
	case 4:
		turblegend.addTo(map);
		if (nexrad_alt > 16000) 
			nexrad_prodid = 91;
		else
			nexrad_prodid = 90;
		break;
	case 5:
		cloudlegend.addTo(map);
		nexrad_prodid = 84;
		nexrad_alt = 0;
		break;
	case 6:
		lightlegend.addTo(map);
		nexrad_prodid = 103;
		nexrad_alt = 0;
		break;
	}

	var nexrad_sql_holder = `SELECT coords AS GEOM, m.prod_id, m.intensity,\
						m.maptime, m.block_num,seq \
						FROM nexrad m INNER JOIN (SELECT MAX(maptime) AS mob FROM nexrad \
						WHERE prod_id = ${nexrad_prodid}) g \
						ON m.maptime = g.mob AND m.prod_id = ${nexrad_prodid}\ 
						AND altitude = ${nexrad_alt} \
						&m=NEXRAD+${nexrad_prodid}+Alt:+${nexrad_alt}`;

	return nexrad_sql_holder;
}

// ** NEXRAD intensity colours.
function getColorInt(alt_color) {
	switch (alt_color) {
	case 1:
		nexrad_color = '#8C8C74';
		break;
	case 2:
		nexrad_color = '#B4C8FF';
		break;
	case 3:
		nexrad_color = '#5F87FF';
		break;
	case 4:
		nexrad_color = '#1446E6';
		break;
	case 5:
		nexrad_color = '#6EF54B';
		break;
	case 6:
		nexrad_color = '#00C300';
		break;
	case 7:
		nexrad_color = '#007300';
		break;
	case 8:
		nexrad_color = '#FFFF00';
		break;	
	case 9:
		nexrad_color = '#FFB430';
		break;
	case 10:
		nexrad_color = '#FA7D00';
		break;	
	case 11:
		nexrad_color = '#E62D00';
		break;
	case 12:
		nexrad_color = '#AF0000';
		break;	
	case 13:
		nexrad_color = '#690000';
		break;
	case 14:
		nexrad_color = '#FA00C8';	
		break;
	case 15:
		nexrad_color = '#9B00FA';	
		break;
		}
return nexrad_color;
}

// ** G-AIRMET
var url_gairmet = url.concat("SELECT coords AS GEOM, rep_num, alt,\
				ob_ele, start_date, stop_date \
				FROM graphics WHERE prod_id = 14\
				&m=G\-AIRMET");

var gairmet_ckbox = document.getElementById("gmet")
var gairmet = L.realtime({
	url: url_gairmet,
	crossOrigin: true, type: 'json'
	}, {interval: 33000,
	style: function(feature){
		altitude_color = getColor(feature.properties.alt);
		return {color: '#5D8C8C', weight: 2, fillColor: altitude_color,
			opacity: 1.0, fillOpacity: 0.2};
	},
	getFeatureId: function(featureData) {
		return featureData.properties.rep_num;
	},
	onEachFeature: function(feature, layer) {
		layer.bindTooltip('G-AIRMET: Alt ' + separator(feature.properties.alt) + '<br>'
			+ feature.properties.ob_ele);
		layer.on('click', function(e) {
			layer.setStyle({color: 'yellow', opacity: 0.8, fillColor: 'yellow',
				fillOpacity: 0.5});
			$("#m1").html("Report");
			$("#m2").html("Altitude");
			$("#m3").html("Report Num");
			$("#m4").html("Condition");
			$("#m5").html("Start");
			$("#m6").html("Stop");
			$('#f1').html('G-AIRMET');
			$('#f2').html(separator(e.target.feature.properties.alt) + 'ft');
			$('#f3').html(e.target.feature.properties.rep_num);
			$('#f4').html(e.target.feature.properties.ob_ele);
			$('#f5').html(e.target.feature.properties.start_date);
			$('#f6').html(e.target.feature.properties.stop_date);

			gairmet.stop();
		});
		layer.on('mouseout', function(e) {
			gairmet.start();
		})
	},
	filter: function(feature, layer) {
		var rangeslider = document.getElementById("gmsliderRange");
		var output = document.getElementById("slidealt");
		if (rangeslider.value == -1000) 
			output.innerHTML = "All"
		else 
			output.innerHTML = separator(rangeslider.value);

		var alt_level = parseInt(rangeslider.value, 10);
		var e = document.getElementById("stim");
		var stim = e.value;
		if (alt_level == -1000) 
			return (feature.properties.alt >= 0 && 
				right(feature.properties.start_date, 5) == stim)
		else 
			return (feature.properties.alt >= (alt_level - 500) &&
				feature.properties.alt <= (alt_level + 500) &&
				right(feature.properties.start_date, 5) == stim);
	}
}).addTo(map);

if (!gairmet_ckbox.checked) {
	map.removeLayer(gairmet),
	gairmet.stop()
}

// ** AIRMET
var url_airmet = url.concat("SELECT coords AS GEOM, g.rep_num, alt, ob_ele,\
			text_data, start_date, stop_date \
			FROM graphics g LEFT JOIN sigairmet s ON (g.prod_id = s.prod_id) \
			AND (g.rep_num = s.rep_num) WHERE g.prod_id = 11\
			&m=AIRMET");

var airmet_ckbox = document.getElementById("amet")
var	airmet = L.realtime({
	url: url_airmet,
	crossOrigin: true, type: 'json'
	}, {interval: 35000,
	style: function(feature) {
		altitude_color = getColor(feature.properties.alt);
		return {color: '#00cccc', weight: 2, fillColor: altitude_color,
			opacity: 1.0, fillOpacity: 0.2};
	},
	getFeatureId: function(featureData) {
		return featureData.properties.rep_num;
	},
	onEachFeature: function(feature, layer) {
//		layer.bindTooltip('AIRMET: Alt ' + feature.properties.alt);
		layer.on('mousedown', function(e) {
			layer.setStyle({fillColor: 'yellow', fillOpacity: 0.5});
			$("#m1").html("Report");
			$("#m2").html("Altitude");
			$("#m3").html("Report Num");
			$("#m4").html("Condition");
			$("#m5").html("Start");
			$("#m6").html("Stop");
			$('#f1').html('AIRMET');
			$('#f2').html(separator(e.target.feature.properties.alt) + 'ft');
			$('#f3').html(e.target.feature.properties.rep_num);
			$('#f4').html(e.target.feature.properties.text_data);
			$('#f5').html(e.target.feature.properties.start_date);
			$('#f6').html(e.target.feature.properties.stop_date);

			var html_airmet = '';
			var pixelPosition = e.layerPoint;
			var latLng = map.layerPointToLatLng(pixelPosition);
			var pip_airmet = leafletPip.pointInLayer(latLng, map, false);
			if (pip_airmet.length) {
				for (var i = 0; i < pip_airmet.length; i++) {
					airmet_object[i] = pip_airmet[i];	//.feature.properties;
					html_airmet += "<a onclick= 'airmet_overlap(\"" 
						+ airmet_object[i] + "\",\"" + i + "\");'>" + 
						"AIRMET - Alt: " +
						separator(pip_airmet[i].feature.properties.alt) + " : " + " Rep num: " +
						pip_airmet[i].feature.properties.rep_num + "</a><br>" ;
				}
				if (html_airmet) {
					layer.bindPopup(html_airmet, popupOptions);
				}
			}
			airmet.stop();
		});
		layer.on('mousedown', function(e) {
			airmet.start();
		})
	},
	filter: function(feature, layer) {
		var rangeslider = document.getElementById("gmsliderRange");
		var output = document.getElementById("slidealt");
		if (rangeslider.value == -1000) 
			output.innerHTML = "All"
		else 
			output.innerHTML = separator(rangeslider.value);

		var alt_level = parseInt(rangeslider.value, 10);
		if (alt_level == -1000) 
			return (feature.properties.alt >= 0)
		else
			return (feature.properties.alt >= (alt_level - 500) &&
				feature.properties.alt <= (alt_level + 500));
	}
}).addTo(map);

if (!airmet_ckbox.checked) {
	map.removeLayer(airmet),
	airmet.stop()
}

// ** SIGMET
var url_sigmet = url.concat("SELECT coords AS GEOM, g.rep_num, alt,\
			ob_ele, text_data, start_date, stop_date \
			FROM graphics g LEFT JOIN sigairmet s ON (g.prod_id = s.prod_id) AND \
			(g.rep_num = s.rep_num) WHERE g.prod_id = 12\
			&m=SIGMET");

var sigmet_ckbox = document.getElementById("smet")
var sigmet = L.realtime({
	url: url_sigmet,
	crossOrigin: true, type: 'json'
	}, {interval: 60000,
	style: function(feature) {
		altitude_color = getColor(feature.properties.alt);
		return {color: '#00cccc', weight: 2, fillColor: altitude_color,
			opacity: 1.0, fillOpacity: 0.2};
	},
	getFeatureId: function(featureData) {
		return featureData.properties.rep_num;
	},
	onEachFeature: function(feature, layer) {
//		layer.bindTooltip('SIGMET: Alt ' + feature.properties.alt);
		layer.on('mousedown', function(e) {
			layer.setStyle({fillColor: 'yellow', fillOpacity: 0.5});
			$("#m1").html("Report");
			$("#m2").html("Altitude");
			$("#m3").html("Report Num");
			$("#m4").html("Condition");
			$("#m5").html("Start");
			$("#m6").html("Stop");
			$('#f1').html('SIGMET');
			$('#f2').html(separator(e.target.feature.properties.alt) + 'ft');
			$('#f3').html(e.target.feature.properties.rep_num);
			$('#f4').html(e.target.feature.properties.text_data);
			$('#f5').html(e.target.feature.properties.start_date);
			$('#f6').html(e.target.feature.properties.stop_date);

			var html_sigmet = '';
			var pixelPosition = e.layerPoint;
			var latLng = map.layerPointToLatLng(pixelPosition);
			var pip_sigmet = leafletPip.pointInLayer(latLng, map, false);
			if (pip_sigmet.length) {
				for (var i = 0; i < pip_sigmet.length; i++) {
					sigmet_object[i] = pip_sigmet[i];	//.feature.properties;
					html_sigmet += "<a onclick= 'sigmet_overlap(\"" 
						+ sigmet_object[i] + "\",\"" + i + "\");'>" + 
						"SIGMET - Alt: " +
						separator(pip_sigmet[i].feature.properties.alt) + " : " + " Rep num: " +
						pip_sigmet[i].feature.properties.rep_num + "</a><br>" ;
				}
				if (html_sigmet) {
					layer.bindPopup(html_sigmet, popupOptions);
				}
			}
			sigmet.stop();
		});
		layer.on('mousedown', function(e) {
			sigmet.start();
		})
	},
	filter: function(feature, layer) {
		var rangeslider = document.getElementById("gmsliderRange");
		var output = document.getElementById("slidealt");
		if (rangeslider.value == -1000)
			output.innerHTML = "All"
		else
			output.innerHTML = separator(rangeslider.value);

		var alt_level = parseInt(rangeslider.value, 10);
		if (alt_level == -1000)
			return (feature.properties.alt >= 0)
		else
			return (feature.properties.alt >= (alt_level - 500) &&
				feature.properties.alt <= (alt_level + 500));
	}
}).addTo(map);

if (!sigmet_ckbox.checked) {
	map.removeLayer(sigmet),
	sigmet.stop()
}

// ** NEXRAD
nexrad_sql = getNexrad();
url_nexrad = url.concat(nexrad_sql);

var nexrad_layer_group = new L.FeatureGroup();
var nexrad = L.realtime({
	url: url_nexrad,
	crossOrigin: true, type: 'json'
	}, {interval: 55000,

	getFeatureId: function(featureData) {
		return featureData.properties.seq;
	},

	style: function(feature) {
		$("#m1").html("Latest");
		$('#f1').html(feature.properties.maptime + 'z');

		if (feature.properties.prod_id == 84 || feature.properties.prod_id == 90
				|| feature.properties.prod_id == 91 ) {
			nexrad_color = getColorInt(feature.properties.intensity);
			return {color: nexrad_color, weight: 4, fillColor: nexrad_color,
				opacity: 0.5, fillOpacity: 0.5}
		}
	},
	pointToLayer: function(feature, latlng) {
		if (feature.properties.prod_id != 84 ) {
			var currentPoint = map.latLngToContainerPoint(latlng);
			var width = 5;		//5
			var height = 5;		//5
			var xDifference = width / 2;
			var yDifference = height / 2;
			var southWest = L.point((currentPoint.x - xDifference),
				(currentPoint.y - yDifference));
			var northEast = L.point((currentPoint.x + xDifference),
				(currentPoint.y + yDifference));
			var bounds = L.latLngBounds(map.containerPointToLatLng(southWest),
				map.containerPointToLatLng(northEast));

			nexrad_color = getColorInt(feature.properties.intensity);
			var rectOptions = {fillColor: nexrad_color, fillOpacity: 0.2, weight: 0}
			radar_point = L.rectangle(bounds, rectOptions); 

			nexrad_layer_group.addLayer(radar_point);
			map.addLayer(nexrad_layer_group);
			nexrad.stop();
		};
	}
}).addTo(map)

// ** CWA
var url_cwa = url.concat("SELECT coords AS GEOM, g.rep_num, alt, ob_ele,\
			text_data, start_date, stop_date \
			FROM graphics g LEFT JOIN sigairmet s ON (g.prod_id = s.prod_id)\
			AND (g.rep_num = s.rep_num) WHERE g.prod_id = 15\
			&m=CWA");

var cwa_ckbox = document.getElementById("cwa")
var cwa = L.realtime({
	url: url_cwa,
	crossOrigin: true, type: 'json'
	}, {interval: 77000,
	style: function(feature) {
		altitude_color = getColor(feature.properties.alt);
		return {color: '#00cccc', weight: 2, fillColor: altitude_color,
			opacity: 1.0, fillOpacity: 0.2};
	},
	getFeatureId: function(featureData) {
		return featureData.properties.rep_num;
	},
	onEachFeature: function(feature, layer) {
		layer.bindTooltip('CWA: Alt ' + separator(feature.properties.alt));
		layer.on('click', function(e) {
			layer.setStyle({fillColor: 'yellow', fillOpacity: 0.5});
			$("#m1").html("Report");
			$("#m2").html("Altitude");
			$("#m3").html("Report Num");
			$("#m4").html("Condition");
			$("#m5").html("Start");
			$("#m6").html("Stop");
			$('#f1').html('CWA');
			$('#f2').html(separator(e.target.feature.properties.alt) + 'ft');
			$('#f3').html(e.target.feature.properties.rep_num);
			$('#f4').html(e.target.feature.properties.text_data);
			$('#f5').html(e.target.feature.properties.start_date);
			$('#f6').html(e.target.feature.properties.stop_date);

			cwa.stop();
		});
		layer.on('mouseout', function(e) {
			cwa.start();
		})
	},
	filter: function(feature,layer) {
		var rangeslider = document.getElementById("gmsliderRange");
		var output = document.getElementById("slidealt");
		if (rangeslider.value == -1000)
			output.innerHTML = "All"
		else
			output.innerHTML = separator(rangeslider.value);

		var alt_level = parseInt(rangeslider.value, 10);
		if (alt_level == -1000) 
			return (feature.properties.alt >= 0)
		else
			return (feature.properties.alt >= (alt_level - 500) &&
				feature.properties.alt <= (alt_level + 500));
	}
}).addTo(map);

if (!cwa_ckbox.checked) {
	map.removeLayer(cwa), 
	cwa.stop()
}

// ** SUA 
var url_sua = url.concat("SELECT s.airsp_id, rep_time, t.airsp_type_desc,\
			s.airsp_name, sched_status_desc, start_date, stop_date,\
			high_alt, low_alt, coords AS GEOM, dafif_name, sep_rule, shape_ind \
			FROM sua s INNER JOIN sua_airspace a ON a.airsp_id = s.airsp_id \
			INNER JOIN sua_airspace_type t ON t.airsp_type = s.airsp_type \
			INNER JOIN sua_sched_status c ON c.sched_status = s.sched_status \
			ORDER BY s.airsp_name, rep_num &m=SUA");

var sua_ckbox = document.getElementById("sua")
var sua = L.realtime({
	url: url_sua,
	crossOrigin: true, type: 'json'
	}, {interval: 50000,
	style: function(feature) {
		return {color: '#2e052a', weight: 3, fillColor: '#2e052a',
			opacity: 0.5, fillOpacity: 0.5};
	},
	getFeatureId: function(featureData) {
		return featureData.properties.airsp_name;
	},
	onEachFeature: function(feature, layer) {
//		layer.bindTooltip('SUA: ' + feature.properties.airsp_name);
		layer.on('mousedown', function(e) {
//			map.closePopup();
			layer.setStyle({color: 'yellow', fillColor: 'orange', fillOpacity: 0.5});
			$("#m1").html("Report");
			$("#m2").html("Status");
			$("#m3").html("Times");
			$("#m4").html("Altitudes L/H");
			$("#m5").html("Sep/shape");
			$("#m6").html("DAFIF");
			$('#f1').html('SUA - ' + e.target.feature.properties.airsp_name);
			$('#f2').html(e.target.feature.properties.airsp_type_desc + ' <br>'
				+ e.target.feature.properties.sched_status_desc);
			$('#f3').html(e.target.feature.properties.start_date + ' <br>'
				+ e.target.feature.properties.stop_date);
			$('#f4').html(e.target.feature.properties.low_alt + ' <br>'
				+ e.target.feature.properties.high_alt);
			$('#f5').html(e.target.feature.properties.sep_rule + '  '
				+ e.target.feature.properties.shape_ind);
			$('#f6').html(e.target.feature.properties.dafif_name);
			
			var html = '';
			var pixelPosition = e.layerPoint;
			var latLng = map.layerPointToLatLng(pixelPosition);
			var match = leafletPip.pointInLayer(latLng, map, false);

			if (match.length) {
				for (var i = 0; i < match.length; i++) {
					sua_object[i] = match[i].feature.properties;
					if (match[i].feature.properties.airsp_name) {
						html += "<a onclick= 'sua_overlap(\"" 
							+ sua_object[i] + "\",\"" + i +"\");'>" 
							+ match[i].feature.properties.airsp_name + "</a><br>" ;
					}
				}
				if (html) {
					layer.bindPopup(html, popupOptions);
				}
			}

			sua.stop();
		})
		
		layer.on('mouseout', function(e) {
			html='';
			sua.start();
		});
			
		if (!sua_ckbox.checked) {
			map.removeLayer(sua),
			sua.stop();
		}
	},
}).addTo(map);

if (!sua_ckbox.checked) {
	map.removeLayer(sua),
	sua.stop()
}

// ** NOTAM TFR - Circle
var url_circle = url.concat("SELECT bot AS GEOM, c.start_date, c.stop_date, c.rec_count, \
			c.rep_num, c.r_lng, c.r_lat, c.alt_top, c.alt_bot, c.alpha, s.text_data \
			FROM circles c \
			LEFT JOIN sigairmet s ON s.rep_num = c.rep_num AND c.prod_id = s.prod_id \
			&m=NOTAM circle");

var cmarkers = L.markerClusterGroup({
	iconCreateFunction: function(cluster) {
		var n = cluster.getChildCount();
		return L.divIcon({ html: n, className: 'mycluster2', iconSize: L.point[1,1]});
	},
	spiderfyOnMaxZoom: true,
	showCoverageOnHover: false,
	maxClusterRadius: 20,
	zoomToBoundsOnClick: true,
});

var notam_ckbox = document.getElementById("notam")
var cir = L.realtime({
	url: url_circle,
	crossOrigin: true, type: 'json'
	}, {interval: 70000,
	getFeatureId: function(featureData) {
	return featureData.properties.rep_num + featureData.properties.rec_count + featureData.properties.start_date;
	},
	pointToLayer: function(feature, latlng) {
		marker = L.circleMarker(latlng, {color: 'red', fillcolor: 'yellow'});
		marker.bindTooltip('NOTAM-TFR<br>' + feature.properties.rep_num + '  '+ feature.properties.rec_count);
		marker.on('click', function(e) {
			$("#m1").html("Altitude");
			$("#m2").html("Radius");
			$("#m3").html("Rep Number");
			$("#m4").html("Start");
			$("#m5").html("Stop");
			$("#m6").html("Text ");
			$('#f1').html('Bottom ' + separator(e.target.feature.properties.alt_bot) + 'ft<br> Top '
				+ separator(e.target.feature.properties.alt_top) + 'ft');
			$('#f2').html('Lat: ' + e.target.feature.properties.r_lat + ' Long: '
				+ e.target.feature.properties.r_lat + ' Alpha: '
				+ e.target.feature.properties.alpha);
			$('#f3').html(e.target.feature.properties.rep_num
				+ '<br>' + e.target.feature.properties.rec_count);
			$('#f4').html(e.target.feature.properties.start_date);
			$('#f5').html(e.target.feature.properties.stop_date);
			$('#f6').html(e.target.feature.properties.text_data);
			
			cir.stop();
		});

		if (!notam_ckbox.checked) {
			map.removeLayer(cmarkers), 
			cmarkers.removeLayer(cmarkers),
			map.removeLayer(marker), 
			cir.stop()
		}
		else {
			cmarkers.addLayer(marker);
			map.addLayer(cmarkers);
			cir.start();
	
			return marker;
		};
	}
}).addTo(map);

// ** Segmented graphical NOTAMS
var url_seg_notam = url.concat("SELECT coords AS GEOM, alt, g.rep_num,\
			start_date, stop_date, text_data \
			FROM graphics g LEFT JOIN sigairmet s ON s.rep_num = g.rep_num \
			WHERE g.segmented = 1 AND g.prod_id = 8 &m=NOTAM segmented");

var notam_ckbox = document.getElementById("notam")

var seg = L.realtime({
	url: url_seg_notam,
	crossOrigin: true, type: 'json'
	}, {interval: 70000,
	style: function(feature){
		altitude_color = getColor(feature.properties.alt);
		return {color: '#00cccc', weight: 2, fillColor: altitude_color, opacity: 1.0, fillOpacity: 0.2};
	},
	getFeatureId: function(featureData) {
		return featureData.properties.rep_num;
	},
	onEachFeature: function(feature, layer) {
		layer.bindTooltip('NOTAM-TFR<br>Alt ' + feature.properties.alt);
		layer.on('click', function(e){
			layer.setStyle({fillColor: 'yellow', fillOpacity: 0.5});
			$("#m1").html("Report");
			$("#m2").html("Altitude");
			$("#m3").html("Report Num");
			$("#m4").html("Text");
			$("#m5").html("Start");
			$("#m6").html("Stop");
			$('#f1').html('Graphical NOTAM');
			$('#f2').html(separator(e.target.feature.properties.alt) + 'ft');
			$('#f3').html(e.target.feature.properties.rep_num);
			$('#f4').html(e.target.feature.properties.text_data);
			$('#f5').html(e.target.feature.properties.start_date);
			$('#f6').html(e.target.feature.properties.stop_date);

			seg.stop();
		});
		
		if (!notam_ckbox.checked) {
			map.removeLayer(seg),
			seg.stop()
		}
		else {
			map.addLayer(seg);
			seg.start();
		}
		
		layer.on('mouseout', function(e) {
			seg.start();
		})
	},
}).addTo(map);

// ** METAR 
var url_metar = url.concat("SELECT s.coords AS GEOM, s.stn_call, s.stn_loc,\
			state, ob_date, temperature, windsp, winddir, altimeter, visby, dewp,\
			hrly_precip, slp, windvar, windgust, mtype \
			FROM metar m INNER JOIN (SELECT stn_call, MAX(ob_date) AS mob FROM metar \
			GROUP BY stn_call) g ON m.stn_call = g.stn_call AND m.ob_date = g.mob \
			INNER JOIN stations s ON m.stn_call = s.stn_call\
			&m=METAR");

var metar_ckbox = document.getElementById("meta")

metar = L.realtime({
	url: url_metar,
	removeMissing: true,
	crossOrigin: true, type: 'json'
	}, {interval: 36000,
	getFeatureId: function(featureData) {
		return  featureData.properties.stn_call
			+ featureData.properties.temperature + featureData.properties.ob_date;
	},
	pointToLayer: function(feature, latlng) {
		myCustomColour = getTempColor(feature.properties.temperature)
		var markerHtmlStyles;

		if (feature.properties.mtype == "SPECI") {
			markerHtmlStyles = `background-color: ${myCustomColour};
			color: #ffffff;
			width:10;
			height:28;
			border-radius: 3rem 3rem 0;
			padding: 0;
			font-size: 12px;`
		}
		else {
			markerHtmlStyles = `background-color: ${myCustomColour};
			width:10;
			height:28;
			border-radius: 3rem 3rem 0;
			padding: 0;
			font-size: 10px;`
		}
		marker = L.marker(latlng, {icon: L.divIcon({
			iconSize: "auto",
			html: `<span style="${markerHtmlStyles}"/>`+ feature.properties.temperature })});
		
		marker.bindTooltip(feature.properties.mtype + '<br>' + feature.properties.stn_call
			+ '<br>' + feature.properties.temperature + '&#x2109');
		marker.on('click', function(e) {
			var hold1;
			var hold2;
			var hold3;

			$('#m1').html(e.target.feature.properties.mtype);
			$("#m2").html("Location");
			$("#m3").html("Temp:<br>Precip:");
			$("#m4").html("Winds");
			$("#m5").html("Visibility");
			$("#m6").html("Altimeter<br>SLP");
			$('#f1').html('<a href=page5?StnID="'+ e.target.feature.properties.stn_call
				+ '" onClick="return popup(this,\'notes\')">'
				+ e.target.feature.properties.stn_call  +' </a> - @'
				+ e.target.feature.properties.ob_date + 'z');
			$('#f2').html(e.target.feature.properties.stn_loc + ", "
				+ e.target.feature.properties.state);

			if (feature.properties.temperature == "- ")
				hold1 = " n/a";
			else
				hold1 = feature.properties.temperature + "\xB0F  - dp:"
					+ e.target.feature.properties.dewp + "\xB0F";

			if (feature.properties.hrly_precip == "- ")
				hold2 = " -";
			else
				hold2 = feature.properties.hrly_precip + " in/hour"

			$('#f3').html(hold1 + "<br>" + hold2);

			if (feature.properties.windvar == "Variable")
				hold2 = feature.properties.windvar;
			else
				hold2 = feature.properties.winddir + "\xB0";

			if (feature.properties.windgust == "-")
				hold3 = " ";
			else
				hold3 = " Gusts: " + feature.properties.windgust + "kts";

			if (feature.properties.windsp == "-") {
				hold1 = " n/a";
				hold2 = " ";
				hold3 = " ";
				}
			else	
				hold1 = feature.properties.windsp + " kts ";

			$('#f4').html(hold1 + hold2 + hold3);

			if (feature.properties.visby == "-")
				hold1 = "n/a";
			else
				hold1 = feature.properties.visby + " (sm)";

			$('#f5').html(hold1);

			if (feature.properties.altimeter == "-")
				hold1 = "n/a";
			else
				hold1 = feature.properties.altimeter + " (Ins)";

			if (feature.properties.slp == "-")
				hold2 = "n/a";
			else
				hold2 = feature.properties.slp + " (hPa)";

			$('#f6').html(hold1 + "<br>" + hold2);
		});
		marker.addTo(map);
			
		if (!metar_ckbox.checked) {
			map.removeLayer(marker),
			metar.stop()
		}

		return marker;
	}
}).addTo(map);

if (!metar_ckbox.checked) {
	map.removeLayer(metar),
	metar.stop()
}

// ** METAR Max/Min

var url_maxmin = url.concat("DROP TABLE IF EXISTS max_a; DROP TABLE IF EXISTS max_b;\
		DROP TABLE IF EXISTS max_c; DROP TABLE IF EXISTS max_d; \
		SELECT stn_call, MAX(ob_date) INTO temp max_a FROM metar GROUP BY stn_call; \
		SELECT m.stn_call, ob_date, cast(temperature AS INTEGER), windsp, winddir, altimeter,\
		visby, dewp, hrly_precip, slp, windvar, windgust \
		INTO temp max_b FROM max_a t \
		INNER JOIN metar m ON (t.stn_call = m.stn_call) AND (t.max = m.ob_date) \
		WHERE (m.temperature <> '- '); \
		SELECT b.* INTO max_c FROM max_b b \
		INNER JOIN max_b c on c.temperature = (SELECT MIN(temperature) FROM max_b) AND c.ob_date = b.ob_date \
		AND b.stn_call = c.stn_call; \
		SELECT b.* INTO max_d FROM max_b b \
		INNER JOIN max_b e ON e.temperature = (SELECT MAX(temperature) FROM max_b) AND e.ob_date = b.ob_date \
		AND b.stn_call = e.stn_call; \
		SELECT coords AS GEOM, s.stn_call, s.stn_loc, s.state, c.ob_date, c.temperature,\
		c.windsp, c.winddir, c.altimeter, c.visby, c.dewp, c.hrly_precip, c.slp,\
		c.windvar, c.windgust, 'Min' AS maxmin FROM max_c c \
		INNER JOIN stations s ON s.stn_call = c.stn_call \
		INNER JOIN max_c d ON d.ob_date = c.ob_date \
		WHERE c.ob_date IN (SELECT MAX(ob_date) FROM max_c) \
		UNION \
		SELECT coords AS GEOM, s.stn_call, s.stn_loc, s.state, c.ob_date, c.temperature,\
		c.windsp, c.winddir, c.altimeter, c.visby, c.dewp, c.hrly_precip, c.slp,\
		c.windvar, c.windgust, 'Max' AS maxmin FROM max_d c \
		INNER JOIN stations s ON s.stn_call = c.stn_call \
		INNER JOIN max_d d ON d.ob_date = c.ob_date \
		WHERE c.ob_date IN (SELECT MAX(ob_date) FROM max_d) \
		&m=METAR maxmin");

var wxIcon6;
var maxmin_ckbox = document.getElementById("mxmn")

maxmin = L.realtime({
	url: url_maxmin,
	crossOrigin: true, type: 'json'
	}, {interval: 20000,
	getFeatureId: function(featureData) {
		return featureData.properties.stn_call + featureData.properties.temperature;
	},
	pointToLayer: function(feature, latlng) {
		if (feature.properties.maxmin == "Max")
			wxIcon6 = L.icon({iconUrl: 'red.ico', iconSize: [15,15]})
		else
			wxIcon6 = L.icon({iconUrl: 'blue.ico', iconSize: [15,15]});
		
		mmarker = L.marker(latlng, {icon: wxIcon6});
		mmarker.bindTooltip(feature.properties.maxmin + ': '
			+ feature.properties.temperature + '&#x2109' + '<br>'
			+ feature.properties.stn_call );
		mmarker.on('click', function(e) {
			var hold1;
			var hold2;
			var hold3;

			$("#m1").html("Station" );
			$("#m2").html("Location");
			$("#m3").html("Temp:<br>Precip:");
			$("#m4").html("Winds");
			$("#m5").html("Visibility");
			$("#m6").html("Altimeter<br>SLP");
	$('#f1').html('<a href=page5?StnID="'+ e.target.feature.properties.stn_call
		+ '" onClick="return popup(this,\'notes\')">'
		+ e.target.feature.properties.stn_call +' </a> - @'
		+ e.target.feature.properties.ob_date + 'z');
			$('#f2').html(e.target.feature.properties.stn_loc + ", "
				+ e.target.feature.properties.state);

			if (feature.properties.temperature == "- ")
				hold1 = " n/a";
			else
				hold1 = feature.properties.temperature + "\xB0F  - dp:"
					+ e.target.feature.properties.dewp + "\xB0F";

			if (feature.properties.hrly_precip == "- ")
				hold2 = " -";
			else
				hold2 = feature.properties.hrly_precip + " in/hour"

			$('#f3').html(hold1 + "<br>" + hold2);

			if (feature.properties.windvar == "Variable")
				hold2 = feature.properties.windvar;
			else
				hold2 = feature.properties.winddir + "\xB0";

			if (feature.properties.windgust == "-")
				hold3 = " ";
			else
				hold3 = " Gusts: " + feature.properties.windgust + "kts";

			if (feature.properties.windsp == "-") {
				hold1 = " n/a";
				hold2 = " ";
				hold3 = " ";
				}
			else
				hold1 = feature.properties.windsp + " kts ";

			$('#f4').html(hold1 + hold2 + hold3);

			if (feature.properties.visby == "-")
				hold1 = "n/a";
			else
				hold1 = feature.properties.visby + " (sm)";

			$('#f5').html(hold1);

			if (feature.properties.altimeter == "-")
				hold1 = "n/a";
			else
				hold1 = feature.properties.altimeter + " (Ins)";

			if (feature.properties.slp == "-")
				hold2 = "n/a";
			else
				hold2 = feature.properties.slp + " (hPa)";

			$('#f6').html(hold1 + "<br>" + hold2);
		});
		mmarker.addTo(map);

		if (!maxmin_ckbox.checked) {
			map.removeLayer(mmarker),
			maxmin.stop()
		}

		return mmarker;
	}
}).addTo(map);

if (!maxmin_ckbox.checked) {
	map.removeLayer(maxmin),
	maxmin.stop()
}

// ** NOTAM
var url_notam = url.concat("SELECT t.coords AS GEOM, s.stn_call, stn_loc,\
			state, s.rep_num, text_data, start_date, stop_date, notam_name \
			FROM sigairmet s LEFT JOIN graphics g ON (g.stn_call = s.stn_call) \
			AND (g.rep_num = s.rep_num) JOIN stations t ON t.stn_call = s.stn_call \
			WHERE s.stn_call != '   ' AND s.prod_id = 8 ORDER BY s.rep_num \
			&m=NOTAM");

var wxIcon2 = L.icon({iconUrl: 'wx2.ico', iconSize: [15,15]});
var notam_ckbox = document.getElementById("notam")

var narkers = L.markerClusterGroup({

	iconCreateFunction: function(cluster) {
		var n = cluster.getChildCount();
		return L.divIcon({ html: n, className: 'mycluster', iconSize: L.point[1,1]});
	},
	spiderfyOnMaxZoom: true,
	showCoverageOnHover: false,
	maxClusterRadius: 20,
	zoomToBoundsOnClick: true,
});

notam = L.realtime({
	url: url_notam,
	crossOrigin: true, type: 'json'
	}, {interval: 33800,
	getFeatureId: function(featureData) {
		return featureData.properties.stn_call + featureData.properties.rep_num;
	},
	pointToLayer: function(feature, latlng) {
		marker = L.marker(latlng, {icon: wxIcon2});
		marker.bindTooltip(feature.properties.notam_name
			+ '<br>' + feature.properties.stn_call);
		marker.on('click', function(e) {
			$("#m1").html("Station");
			$("#m2").html("Location");
			$("#m3").html("Report Num");
			$("#m4").html("Text");
			$("#m5").html("Start");
			$("#m6").html("Stop");
			$('#f1').html(e.target.feature.properties.stn_call + ' - '
				+ feature.properties.notam_name);
			$('#f2').html(e.target.feature.properties.stn_loc + ", "
				+ e.target.feature.properties.state);
			$('#f3').html(e.target.feature.properties.rep_num);
			$('#f4').html(e.target.feature.properties.text_data);
			$('#f5').html(e.target.feature.properties.start_date);
			$('#f6').html(e.target.feature.properties.stop_date);
		});
		if (!notam_ckbox.checked) {
			map.removeLayer(narkers),
			narkers.removeLayer(narkers),
			map.removeLayer(marker),
			notam.stop();
		}
		else {
			narkers.addLayer(marker);
			map.addLayer(narkers);
			notam.start();

			return marker;
		}
	}
}).addTo(map);

// ** TAF
var url_taf = url.concat("SELECT coords AS GEOM, t.stn_call, stn_loc, state,\
			issued, current, wind, visby, condx, rep_time \
			FROM taf t INNER JOIN (SELECT stn_call, MAX(issued) AS mob FROM taf \
			GROUP BY stn_call) g ON t.stn_call = g.stn_call AND t.issued = g.mob \
			INNER JOIN stations s ON t.stn_call = s.stn_call \
			&m=TAF");

var wxIcon3 = L.icon({iconUrl: 'wx1.ico', iconSize: [15,15]});
var taf_ckbox = document.getElementById("taf")

taf = L.realtime({
	url: url_taf,
	crossOrigin: true, type: 'json'
	}, {interval: 30000,
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
			$('#f2').html(e.target.feature.properties.stn_loc + ", "
				+ e.target.feature.properties.state);
			$('#f3').html(e.target.feature.properties.issued + '<br>'
				+ e.target.feature.properties.current);
			$('#f4').html(e.target.feature.properties.wind);
			$('#f5').html(e.target.feature.properties.visby);
			$('#f6').html(e.target.feature.properties.condx);
		});
		marker.addTo(map);

		if (!taf_ckbox.checked) {
			map.removeLayer(marker),
			taf.stop()
		}

		return marker;
	}
}).addTo(map);

if (!taf_ckbox.checked) {
	map.removeLayer(taf),
	taf.stop()
}

// ** Winds Aloft
var url_winds = url.concat("SELECT coords AS GEOM, w.stn_call, stn_loc, state, issue_date,\
			alt1, dir1, spd1, temp1, alt2, dir2, spd2, temp2, alt3, dir3, spd3, temp3,\
			alt4, dir4, spd4, temp4, alt5, dir5, spd5, temp5, alt6, dir6, spd6, temp6,\
			alt7, dir7, spd7, temp7, alt8, dir8, spd8, temp8, alt9, dir9, spd9, temp9 \
			FROM winds w INNER JOIN (SELECT stn_call, MAX(issue_date) AS mx FROM winds \
			GROUP BY stn_call) g ON w.stn_call = g.stn_call AND w.issue_date = g.mx \
			INNER JOIN stations s ON w.stn_call = s.stn_call \
			&m=Winds");

var wxIcon5 = L.icon({iconUrl: 'wind.ico', iconSize: [15,15]});
var winds_ckbox = document.getElementById("winds")

winds = L.realtime({
	url: url_winds,
	crossOrigin: true, type: 'json'
	}, {interval: 67000,
	getFeatureId: function(featureData) {
		return featureData.properties.stn_call;
	},
	pointToLayer: function(feature, latlng) {
		marker = L.marker(latlng, {icon: wxIcon5});
		marker.bindTooltip('Winds' + '<br>' + feature.properties.stn_call);
		marker.on('click', function(e) {
			$("#m1").html("Station" + '<br>' + e.target.feature.properties.issue_date);
			$("#m2").html(separator(e.target.feature.properties.alt1) + "ft" + '<br>'
				+ separator(e.target.feature.properties.alt2) + "ft");
			$("#m3").html(separator(e.target.feature.properties.alt3) + "ft" + '<br>'
				+ separator(e.target.feature.properties.alt4) + "ft");
			$("#m4").html(separator(e.target.feature.properties.alt5) + "ft" + '<br>'
				+ separator(e.target.feature.properties.alt6) + "ft");
			$("#m5").html(separator(e.target.feature.properties.alt7) + "ft" + '<br>'
				+ separator(e.target.feature.properties.alt8) + "ft");

			if (feature.properties.alt9 == '(null)')
				$("#m6").html(" - ");
			else
				$("#m6").html(separator(e.target.feature.properties.alt9) + "ft");
			
			$('#f1').html(e.target.feature.properties.stn_call + " (Winds)" + '<br>'
				+ e.target.feature.properties.stn_loc + ", "
				+ e.target.feature.properties.state);

			if (feature.properties.dir1 ==	"Light and variable") {
				var dir1 = feature.properties.dir1;
				var spd1 = "  ";
			}
			else {
				var dir1 = feature.properties.dir1 + "\xB0  ";
				var spd1 = feature.properties.spd1.replace(/\b0+/g, '') + "kt  ";
			}

			if (feature.properties.dir2 ==	"Light and variable") {
				var dir2 = feature.properties.dir2;
				var spd2 = "  ";
			}
			else {
				var dir2 = feature.properties.dir2 + "\xB0  ";
				var spd2 = feature.properties.spd2.replace(/\b0+/g, '') + "kt  ";
			}

			if (feature.properties.temp1 ==	"+00") {
				var temp1 = "0\xB0C <br>";
			}
			else {
				var temp1 = feature.properties.temp1.replace(/\b0+/g, '') + "\xB0C" + '<br>'
			}
			if (feature.properties.temp2 ==	"+00") {
				var temp2 = "0\xB0C <br>";
			}
			else {
				var temp2 = feature.properties.temp2.replace(/\b0+/g, '') + "\xB0C" + '<br>'
			}

			$('#f2').html(dir1 + spd1 + temp1 + dir2 + spd2 + temp2);

			if (feature.properties.temp3 ==	"+00") {
				var temp3 = "0\xB0C <br>";
			}
			else {
				var temp3 = feature.properties.temp3.replace(/\b0+/g, '') + "\xB0C" + '<br>'
			}

			if (feature.properties.dir3 ==	"Light and variable") {
				var dir3 = feature.properties.dir3;
				var spd3 = "  ";
			}
			else {
				var dir3 = feature.properties.dir3 + "\xB0  ";
				var spd3 = feature.properties.spd3.replace(/\b0+/g, '') + "kt  ";
			}

			if (feature.properties.dir4 ==	"Light and variable") {
				var dir4 = feature.properties.dir4;
				var spd4 = "  ";
			}
			else {
				var dir4 = feature.properties.dir4 + "\xB0  ";
				var spd4 = feature.properties.spd4.replace(/\b0+/g, '') + "kt  ";
			}

			$('#f3').html(dir3 + spd3 + temp3
				+ dir4 + spd4
				+ e.target.feature.properties.temp4.replace(/\b0+/g, '') + "\xB0C" + '<br>');

			if (feature.properties.dir5 ==	"Light and variable") {
				var dir5 = feature.properties.dir5;
				var spd5 = "  ";
			}
			else {
				var dir5 = feature.properties.dir5 + "\xB0  ";
				var spd5 = feature.properties.spd5.replace(/\b0+/g, '') + "kt  ";
			}
			
						if (feature.properties.dir6 ==	"Light and variable") {
				var dir6 = feature.properties.dir6;
				var spd6 = "  ";
			}
			else {
				var dir6 = feature.properties.dir6 + "\xB0  ";
				var spd6 = feature.properties.spd6.replace(/\b0+/g, '') + "kt  ";
			}

			$('#f4').html(dir5 + spd5
				+ e.target.feature.properties.temp5.replace(/\b0+/g, '') + "\xB0C" + '<br>'
				+ dir6 + spd6
				+ e.target.feature.properties.temp6.replace(/\b0+/g, '') + "\xB0C" + '<br>');
			$('#f5').html(e.target.feature.properties.dir7 + "\xB0  "
				+ e.target.feature.properties.spd7.replace(/\b0+/g, '') + "kt  "
				+ e.target.feature.properties.temp7.replace(/\b0+/g, '') + "\xB0C" + '<br>'
				+ e.target.feature.properties.dir8 + "\xB0  "
				+ e.target.feature.properties.spd8.replace(/\b0+/g, '') + "kt  "
				+ e.target.feature.properties.temp8.replace(/\b0+/g, '') + "\xB0C" + '<br>');

			if (feature.properties.dir9 == "-") {
				var dir9 = " - ";
			}
			else {
				var dir9 = 	feature.properties.dir9 + "\xB0  ";
			}
			if (feature.properties.spd9 == "-") {
				var spd9 = " - ";
			}
			else {
				var spd9 = 	feature.properties.spd9.replace(/\b0+/g, '') + "kt  ";
			}
			if (feature.properties.temp9 == "-") {
				var temp9 = " - ";
			}
			else {
				var temp9 = feature.properties.temp9.replace(/\b0+/g, '') + "\xB0C" + '<br>';
			}
			
			$('#f6').html(dir9 + spd9 + temp9);
		});
		marker.addTo(map);

		if (!winds_ckbox.checked) {
			map.removeLayer(marker),
			winds.stop()
		}

		return marker;
	}
}).addTo(map);

if (!winds_ckbox.checked) {
	map.removeLayer(winds),
	winds.stop()
}

// ** PIREP
//var url_pirep = url.concat("SELECT coords AS GEOM, p.stn_call, stn_loc, state,\
//			rep_type, fl_lev, ac_type, turbulence, remarks, location, cloud, weather,\
//			temperature, windsp, icing, rep_time \
//			FROM pirep p INNER JOIN (SELECT stn_call, MAX(rep_time) AS mx FROM pirep \
//			GROUP BY stn_call) g ON p.stn_call = g.stn_call AND p.rep_time = g.mx \
//			INNER JOIN stations s ON p.stn_call = s.stn_call \
//			&m=PIREP");

var url_pirep = url.concat("SELECT coords AS GEOM, p.stn_call, stn_loc, state,\
			rep_type, fl_lev, ac_type, turbulence, remarks, location, cloud, weather,\
			temperature, windsp, icing, rep_time \
			FROM pirep p \
			INNER JOIN stations s ON p.stn_call = s.stn_call ORDER BY rep_time \
			&m=PIREP");
var wxIcon4
var pirep_ckbox = document.getElementById("pirep")

var parkers = L.markerClusterGroup({

	iconCreateFunction: function(cluster) {
		var n = cluster.getChildCount();
		return L.divIcon({ html: n, className: 'mycluster', iconSize: L.point[1,1]});
	},
	spiderfyOnMaxZoom: true,
	showCoverageOnHover: false,
	maxClusterRadius: 20,
	zoomToBoundsOnClick: true,
});

pirep = L.realtime({
	url: url_pirep,
	crossOrigin: true, type: 'json'
	}, {interval: 54000,
	getFeatureId: function(featureData) {
		return featureData.properties.stn_call
			+ featureData.properties.rep_time;
	},
	pointToLayer: function(feature, latlng) {
		if (feature.properties.rep_type == "Urgent Report")
			wxIcon4 = L.icon({iconUrl: 'pilot2.ico', iconSize: [17,17]})
		else
			wxIcon4 = L.icon({iconUrl: 'pilot.ico', iconSize: [15,15]});

		marker = L.marker(latlng, {icon: wxIcon4});

		if (feature.properties.rep_type == "Urgent Report")
			marker.bindTooltip('Urgent PIREP' + '<br>'
				+ feature.properties.stn_call + '<br>'
				+ feature.properties.rep_time);
		else
			marker.bindTooltip('PIREP' + '<br>'
				+ feature.properties.stn_call + '<br>'
				+ feature.properties.rep_time);

		marker.on('click', function(e) {
			var hold1;
			var hold2;
			var hold3;
			var hold4;

			$("#m1").html("Station");
			$("#m2").html("Location");
			$("#m3").html("Flt Lev" + '<br>' + "AC Type");
			$("#m4").html("Turbulence" + '<br>' + "Icing");
			$("#m5").html("Cloud<br>Temp<br>Wind<br>WX");
			$("#m6").html("Remarks");
			if (feature.properties.rep_type == "Urgent Report")
				$('#f1').html(e.target.feature.properties.stn_call
					+ " (Urgent PIREP) @"
					+ e.target.feature.properties.rep_time + "z");
			else
				$('#f1').html(e.target.feature.properties.stn_call
					+ " (PIREP) @"
					+ e.target.feature.properties.rep_time + "z");
				
			$('#f2').html(e.target.feature.properties.stn_loc + ", "
				+ e.target.feature.properties.state + "<br><i>Loc: "
				+ e.target.feature.properties.location);
				
			$('#f3').html(e.target.feature.properties.fl_lev + "<br>"
				+ e.target.feature.properties.ac_type);
				
			if (feature.properties.turbulence == "")
				hold1 = "- ";
			else
				hold1 = feature.properties.turbulence;

			if (feature.properties.icing == "")
				hold2 = "- ";
			else
				hold2 = feature.properties.icing;

			$('#f4').html(hold1 + "<br>" + hold2);

			if (feature.properties.cloud == "")
				hold1 = " - ";
			else
				hold1 = feature.properties.cloud;

			if (feature.properties.temperature == "")
				hold2 = " - ";
			else
				hold2 = feature.properties.temperature;

			if (feature.properties.windsp == "")
				hold3 = " - ";
			else
				hold3 = feature.properties.windsp;

			if (feature.properties.weather == "")
				hold4 = " - ";
			else
				hold4 = feature.properties.weather;

			$('#f5').html(hold1 + "<br>" + hold2 + "<br>" + hold3 + "<br>" + hold4);

			if (feature.properties.remarks == "")
				hold1 = " - ";
			else
				hold1 = feature.properties.remarks;

			$('#f6').html(hold1);
		});
		if (!pirep_ckbox.checked) {
			map.removeLayer(parkers),
			parkers.removeLayer(parkers),
			map.removeLayer(marker),
			pirep.stop()
		}
		else {
			parkers.addLayer(marker);
			map.addLayer(parkers);
			pirep.start();

			return marker;
		}
	}
}).addTo(map);

// ** Checkbox controls
document.querySelector("input[name = gmet]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(gairmet),
		gairmet.start()
	}
	else {
		map.removeLayer(gairmet),
		gairmet.stop()
	}
})

document.querySelector("input[name = amet]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(airmet),
		airmet.start()
	}
	else {
		map.removeLayer(airmet),
		airmet.stop()
	}
})

// ** Toggle METAR and Max/Min
document.querySelector("input[name = meta]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(metar),
		metar.start()
	}
	else {
		map.removeLayer(metar),
		metar.stop()
	}
})

// Toggle Max/Min and METAR
document.querySelector("input[name = mxmn]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(maxmin),
		maxmin.start()
	}
	else {
	 map.removeLayer(maxmin),
	 maxmin.stop()
	}
})

// ** Includes graphic NOTAMs
document.querySelector("input[name = notam]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(notam),
		notam.start(),
		cmarkers.addLayer(cmarkers),
		map.addLayer(cir);
		cir.start();
		map.addLayer(seg),
		seg.start()
	}
	else {
		narkers.removeLayer(narkers),
		map.removeLayer(notam),
		notam.stop(),
		cmarkers.removeLayer(cmarkers),
		map.removeLayer(cir);
		cir.stop(),
		map.removeLayer(seg),
		seg.stop()
	}
})

document.querySelector("input[name = sua]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(sua),
		sua.start()
	}
	else {
		map.removeLayer(sua),
		sua.stop()
	}
})

document.querySelector("input[name = taf]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(taf),
		taf.start()
	}
	else {
		map.removeLayer(taf),
		taf.stop()
	}
})

document.querySelector("input[name = pirep]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(pirep),
		pirep.start()
	}
	else {
		parkers.removeLayer(parkers),
		map.removeLayer(pirep),
		pirep.stop()
	}
})

document.querySelector("input[name = winds]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(winds),
		winds.start()
	}
	else {
		map.removeLayer(winds),
		winds.stop()
	}
})

document.querySelector("input[name = smet]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(sigmet),
		sigmet.start()
	}
	else {
		map.removeLayer(sigmet),
		sigmet.stop()
	}
})

document.querySelector("input[name = cwa]").addEventListener('change', function() {
	if(this.checked) {
		map.addLayer(cwa),
		cwa.start()
	}
	else {
		map.removeLayer(cwa),
		cwa.stop()
	}
})

document.getElementById("stim").onchange = function() {
	gairmet.update()
}

document.getElementById("altrad").onchange = function() {
	nexrad_layer_group.clearLayers();
	nexrad_sql = getNexrad();
	url_nexrad = url.concat(nexrad_sql);
	nexrad.setUrl(url_nexrad);
	nexrad_layer_group.addLayer(radar_point);
	map.addLayer(nexrad_layer_group)
}	

document.getElementById("gmsliderRange").onchange = function()
	{gairmet.update(), airmet.update(), sigmet.update(), cwa.update()}

document.getElementById("prodid").onchange = function() {
	var nexrad_select_str = document.getElementById('prodid').value;
	nexrad_sel_prodid = parseInt(nexrad_select_str);
	map.removeControl(nexlegend);
	map.removeControl(turblegend);
	map.removeControl(icelegend);
	map.removeControl(lightlegend);
	map.removeControl(cloudlegend);

	switch(nexrad_sel_prodid) {
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
	nexrad_layer_group.clearLayers();
	nexrad_sql = getNexrad();
	url_nexrad = url.concat(nexrad_sql);
	nexrad.setUrl(url_nexrad);
	nexrad_layer_group.addLayer(radar_point);
	map.addLayer(nexrad_layer_group)
}

// Map legends
turblegend = L.control({ position: "topright" });
turblegend.onAdd = function() {
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
cloudlegend.onAdd = function() {
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
icelegend.onAdd = function() {
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
lightlegend.onAdd = function() {
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
nexlegend.onAdd = function() {
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
	"Gray":Esri_WorldGrayCanvas,
	"Imagery":Esri_WorldImagery,
	"Open Street Map": osm,
	"OSM B&W":OpenStreetMap_BlackAndWhite
};

var overlayMaps = {};
L.control.layers(baseMaps, overlayMaps).addTo(map);
