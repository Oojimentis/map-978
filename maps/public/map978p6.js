// ** Map978 Display Station popup

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sql?q=");

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

var wxIcon = L.icon({iconUrl: 'radiotower2.ico', iconSize: [20,20]});

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