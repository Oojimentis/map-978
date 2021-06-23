var serv_port = document.getElementById('port').value;
var url1 = "http://localhost:";
var url = url1.concat(serv_port, "/sql?q=");
var table; 

// ** NOTAM TFR 

var url_tfr = url.concat("SELECT '0101000020E6100000A01A2FDD24F263C09A99999999594F40' AS GEOM, \
					s.rep_num, text_data, notam_name FROM sigairmet s \
					LEFT JOIN graphics g ON g.rep_num = s.rep_num \
					WHERE s.prod_id = 8 AND (SUBSTRING(s.stn_call,1,1) = ' ' OR s.stn_call ='')\
					AND g.rep_num IS NULL");

var	tfr = L.realtime({
	url: url_tfr,
	crossOrigin: true, type: 'json'
	}, {interval: 12000,
	getFeatureId: function(featureData) {
		return featureData.properties.rep_num;
	},
	onEachFeature: function(feature, layer) {
		table = document.getElementById("myTable");
		var row = table.insertRow(0);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		cell1.innerHTML = feature.properties.rep_num;
		cell2.innerHTML = feature.properties.notam_name;
		cell3.innerHTML = feature.properties.text_data;
	},
});