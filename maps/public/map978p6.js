// ** Map978 Display Station popup

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sql?q=");
var urlx = host_url.concat(server_port, "/sqlx?q=");

const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
var stnid = urlParams.get('StnID');

stnid = stnid.replace(/"/g, "'");
stnid = stnid.concat("'");

var map = L.map('mapstn').setView([36.0, -75.26], 7);

var osm=new L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', { 
	attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'}).addTo(map);

var stn_sql = url.concat(`SELECT coords AS GEOM, stn_call, stn_loc, state FROM stations \
			WHERE stn_call = ${stnid} \
			&m=Display Station`);

var wxIcon = L.icon({iconUrl: 'radiotower2.ico', iconSize: [25,25]});

stn = L.realtime({
	url: stn_sql,
	crossOrigin: true, type: 'json'
	}, {interval: 90000,
		pointToLayer: function(feature, latlng) {
			marker = L.marker(latlng, {icon: wxIcon});
			marker.bindTooltip(feature.properties.stn_call);
			marker.addTo(map);
			map.panTo(latlng);

			document.getElementById("f1").innerHTML = feature.properties.stn_call;	
			document.getElementById("f2").innerHTML = feature.properties.stn_loc
				 + ", " + feature.properties.state;
			return marker;
		}

}).addTo(map);
	
stn.stop();

$(document).ready(function() {
	var metar_stn = urlx.concat(`SELECT stn_call, ob_date, winddir, temp, dewp, visby, \
		windsp, altimeter, hrly_precip, slp FROM metar \
		WHERE ob_date = (SELECT MAX(ob_date) FROM metar WHERE stn_call = ${stnid}) \
		AND stn_call = ${stnid} \
		&m=METAR Stn`);

	function get_metar_stn() {
		var row = "";
		$.ajax({
			type: "Get",
			url: metar_stn,
			success: function(data) {
				$('#metarstn tbody').empty();
				$.each(data, function(index, features) {
					row += "<tr><td>" + features.ob_date + "</td><td>"
						+ features.temp + "\xB0F<br>" + features.dewp + "\xB0F</td><td>"
						+ features.hrly_precip + "</td><td>"
						+ features.windsp + "kts - " + features.winddir + "\xB0</td><td>"
						+ features.visby + " (sm)</td><td>"
						+ features.slp + " (hPa)<br>" + features.altimeter + " (Ins)</td></tr>";
				});
				$("#metarstn tbody").append(row);
			},
		});		
	};
	get_metar_stn();
});

$(document).ready(function() {

	var taf_stn = urlx.concat(`SELECT issued, current, wind, visby, condx, rep_time, stn_call \
		FROM taf WHERE rep_time = (SELECT MAX(rep_time) FROM taf WHERE stn_call = ${stnid}) \
		AND stn_call = ${stnid} \
		&m=TAF Stn`);

	function get_taf_stn() {
		var row = "";
		$.ajax({
			type: "Get",
			url: taf_stn,
			success: function(data) {
				$('#tafstn tbody').empty();
				$.each(data, function(index, features) {
					row += "<tr><td>" + features.issued + "</td><td>"
						+ features.wind + "</td><td>" 
						+ features.visby + "</td><td>"
						+ features.condx + "</td></tr>"
				});
				$("#tafstn tbody").append(row);
			},
		});		
	};
	get_taf_stn();
});

$(document).ready(function() {
			
	var pirep_stn = urlx.concat(`SELECT rep_type,fl_lev,ac_type,cloud,weather,temperature, \
		wind_spd_dir,turbulence,icing,remarks,location,rep_time,stn_call \
		from pirep where rep_time = (select max(rep_time) from \
		pirep where stn_call = ${stnid}) and stn_call = ${stnid} \
		&m=PIREP stn`);

	function get_pirep_stn() {
		var row = "";
		$.ajax({
			type: "Get",
			url: pirep_stn,
			success: function(data) {
				$('#pirepstn tbody').empty();
				$.each(data, function(index, features) {
					row += "<tr><td>" + features.rep_time + "</td><td>"
						+ features.rep_type + "<br>" + features.location+ "</td><<td>"
						+ features.fl_lev + "<br>" + features.ac_type + "</td><td>"
						+ features.turbulence + "<br>" + features.icing + "</td><td>"
						+ features.cloud + "<br>" + features.temperature + "</td><td>"
						+ features.wind_spd_dir + "<br>" + features.weather +"</td><td>"
						+ features.remarks + "</td></tr>";
				});
				$("#pirepstn tbody").append(row);
			},
		});		
	};
	get_pirep_stn();
});
