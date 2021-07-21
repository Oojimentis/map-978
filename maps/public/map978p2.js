// ** Map978 Reports Sceen.

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");

// NEXRAD Count
$(document).ready(function() {
	setInterval(get_nexrad_count, 30000);

var nexrad_count = url.concat("SELECT prod_id, fisb_product_desc, altitude, COUNT(*) AS count \
					FROM nexrad, fisb_products WHERE prod_id = fisb_product_id \
					GROUP BY prod_id, fisb_product_desc, altitude ORDER BY prod_id, altitude &m=NEXRAD count");

	function get_nexrad_count() {
		var row = "";
		$.ajax({
			type: "Get",
			url: nexrad_count,
			success: function(data) {
				$('#nexrtbl tbody').empty();
				$.each(data, function(index, features) {
					row += "<tr><td>" + features.fisb_product_desc + "</td><td>"
					+ features.altitude + "</td><<td>"
					+ features.count + "</td></tr>";
				});
				$("#nexrtbl tbody").append(row);
			},
		});		
	};
	get_nexrad_count();
});

// SUA no coords
$(document).ready(function() {
	setInterval(get_sua_nofeat, 60000);

	var sua_nofeat = url.concat("SELECT DISTINCT s.airsp_id, s.airsp_name, s.airsp_type \
					FROM sua s LEFT JOIN sua_airspace a ON a.airsp_id = s.airsp_id \
					WHERE a.airsp_name IS NULL ORDER BY s.airsp_name &m=SUA no coords");

	function get_sua_nofeat() {
		var row = "";
		$.ajax({
			type: "Get",
			url: sua_nofeat,
			success: function(data) {
				$('#suatbl tbody').empty();
				$.each(data, function(index, features) {
					row += "<tr><td>" + features.airsp_id + "</td><td>"
					+ features.airsp_name + "</td><<td>" 
					+ features.airsp_type + "</td></tr>";
				});
				$("#suatbl tbody").append(row);
			},
		});		
	};
	get_sua_nofeat();
});

// ** NOTAM TFR no graphic report.
$(document).ready(function() {
	setInterval(get_tfr_nograph,50000);
			
	var tfr_nograph = url.concat("SELECT s.rep_num, text_data, notam_name FROM sigairmet s \
					LEFT JOIN graphics g ON g.rep_num = s.rep_num \
					WHERE s.prod_id = 8 AND (SUBSTRING(s.stn_call, 1, 1) = ' ' OR s.stn_call ='') \
					AND g.rep_num IS NULL &m=TFR no graphic");

	function get_tfr_nograph() {
		var row = "";
		$.ajax({
			type: "Get",
			url: tfr_nograph,
			success: function(data) {
				$('#tfrtbl tbody').empty();
				$.each(data, function(index, features) {
					row += "<tr><td>" + features.rep_num + "</td><td>"
					+ features.notam_name + "</td><<td>"
					+ features.text_data + "</td></tr>";
				});
				$("#tfrtbl tbody").append(row);
			},
		});		
	};
	get_tfr_nograph();
});