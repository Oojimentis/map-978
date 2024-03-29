// ** Map978 Display Station popup

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sql?q=");
var urlx = host_url.concat(server_port, "/sqlx?q=");

const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
var stnid = urlParams.get('StnID');

stnid = stnid.replace(/"/g, "'");
//stnid = stnid.concat("'");

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
	var metar_stn = urlx.concat(`SELECT stn_call, ob_date, winddir, temperature, dewp, visby, \
		windsp, altimeter, hrly_precip, slp, windvar, windgust FROM metar \
		WHERE ob_date = (SELECT MAX(ob_date) FROM metar WHERE stn_call = ${stnid}) \
		AND stn_call = ${stnid} \
		&m=METAR Stn`);

	function get_metar_stn() {
		var row = "";
		var hold1;
		var hold2;
		var hold3;
		var hold4;
		var hold5;
		var hold6;
		var hold7;
		var hold8;

		$.ajax({
			type: "Get",
			url: metar_stn,
			success: function(data) {
				$('#metarstn tbody').empty();
				$.each(data, function(index, features) {
					if (features.temperature == "- ")
						hold1 = " n/a";
					else
						hold1 = features.temperature + "\xB0F<br>"  
							+ features.dewp + "\xB0F";

					if (features.hrly_precip == "- ")
						hold2 = " -";
					else	
						hold2 = features.hrly_precip + " in/hour"

					if (features.windvar == "Variable")
						hold3 = features.windvar;
					else
						hold3 = features.winddir + "\xB0";

					if (features.windgust == "-")
						hold4 = " ";
					else
						hold4 = " Gusts: " + features.windgust + "kts";	

					if (features.windsp == "-") {
						hold5 = " n/a";
						hold3 = " ";
						hold4= " ";
					}
					else	
						hold5 = features.windsp + " kts ";

					if (features.visby == "-")	
						hold6 = "n/a";
					else
						hold6 = features.visby + " (sm)";

					if (features.altimeter == "-")	
						hold7 = "n/a";
					else
						hold7 = features.altimeter + " (Ins)";

					if (features.slp == "-")	
						hold8 = "n/a";
					else
						hold8 = features.slp + " (hPa)";	

					row += "<tr><td>" 
						+ features.ob_date + "</td><td>"
						+ hold1 + "</td><td>"
						+ hold2 + "</td><td>"
						+ hold5 + "<br>" + hold3 + "<br>" + hold4 + "</td><td>"
						+ hold6 + "</td><td>"
						+ hold7 + "<br>" + hold8 + "</td></tr>";
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
					row += "<tr><td>" 
						+ features.issued + "</td><td>"
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
		windsp,turbulence,icing,remarks,location,rep_time,stn_call \
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
					row += "<tr><td>" 
						+ features.rep_time + "</td><td>"
						+ features.rep_type + "<br>" + features.location+ "</td><td>"
						+ features.fl_lev + "<br>" + features.ac_type + "</td><td>"
						+ features.turbulence + "<br>" + features.icing + "</td><td>"
						+ features.cloud + "<br>" + features.temperature + "</td><td>"
						+ features.windsp + "<br>" + features.weather +"</td><td>"
						+ features.remarks + "</td></tr>";
				});
				$("#pirepstn tbody").append(row);
			},
		});		
	};
	get_pirep_stn();
});
