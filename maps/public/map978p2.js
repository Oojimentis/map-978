var serv_port = document.getElementById('port').value;
var url1 = "http://localhost:";
var url = url1.concat(serv_port, "/sql?q=");
var table;

// NEXRAD Count
$(document).ready(function(){
	$("button").click(function(){
		var row = "";
		var sqltext = 'http://localhost:8000/sqlx?q=select prod_id,fisb_product_desc, \
		altitude,count(*) as count from nexrad,fisb_products where prod_id = fisb_product_id \
		group by prod_id,fisb_product_desc,altitude order by prod_id,altitude';
		$('#stntbl tbody').empty();
		$.get(sqltext, {}, function(data){
			$.each(data, function (index, features) {
				row += "<tr><td>" + features.fisb_product_desc + "</td><td>" 
				+ features.altitude + "</td><<td>" + features.count + "</td></tr>";
			});
			$("#stntbl tbody").append(row);
			
		});
	});
});

// ** NOTAM TFR 

var url_tfr = url.concat("SELECT '0101000020E6100000A01A2FDD24F263C09A99999999594F40' AS GEOM, \
					s.rep_num, text_data, notam_name FROM sigairmet s \
					LEFT JOIN graphics g ON g.rep_num = s.rep_num \
					WHERE s.prod_id = 8 AND (SUBSTRING(s.stn_call,1,1) = ' ' OR s.stn_call ='')\
					AND g.rep_num IS NULL");

var	tfr = L.realtime({
	url: url_tfr,
	crossOrigin: true, type: 'json'
	}, {interval: 60000,
	getFeatureId: function(featureData) {
		return featureData.properties.rep_num;
	},
	onEachFeature: function(feature, layer) {
		table = document.getElementById("tbody");
		var row = table.insertRow(0);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		cell1.innerHTML = feature.properties.rep_num;
		cell2.innerHTML = feature.properties.notam_name;
		cell3.innerHTML = feature.properties.text_data;
	},
});