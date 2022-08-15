// ** Map978 Reports Sceen.

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");

function separator(numb) {
	var str = numb.toString().split(".");
	str[0] = str[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");

	return str.join(".");
}

// NEXRAD Count
$(document).ready(function() {
	setInterval(get_nexrad_count, 30000);
	
var nexrad_count = url.concat("SELECT n.prod_id, f.prod_id_desc, altitude, n.maptime, COUNT(*) AS count \
				FROM nexrad n \
				INNER JOIN (SELECT prod_id, MAX(maptime) AS mob FROM nexrad \
				GROUP BY prod_id) g ON g.prod_id = n.prod_id AND n.maptime = g.mob \
				inner join fisb_products f on f.prod_id =n.prod_id \
				group by n.prod_id,prod_id_desc,altitude,n.maptime \
				order by n.prod_id \
				&m=NEXRAD count");

//var nexrad_count = url.concat("SELECT n.prod_id, f.prod_id_desc, altitude, COUNT(*) AS count \
//				FROM nexrad n, fisb_products f WHERE n.prod_id = f.prod_id \
//				GROUP BY n.prod_id, f.prod_id_desc, altitude ORDER BY n.prod_id, altitude \
//				&m=NEXRAD count");

	function get_nexrad_count() {
		var row = "";
		$.ajax({
			type: "Get",
			url: nexrad_count,
			success: function(data) {
				$('#nexrtbl tbody').empty();
				$.each(data, function(index, features) {
					row += "<tr><td>" + features.prod_id_desc + " (" + features.prod_id + ")</td><td>"
						+ separator(features.altitude) + "</td><td>"
						+ separator(features.count) + "</td><td>"
						+ features.maptime + "</td></tr>";
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

	var sua_nofeat = url.concat("SELECT DISTINCT s.airsp_id, s.airsp_name, t.airsp_type_desc \
					FROM sua s LEFT JOIN sua_airspace a ON a.airsp_id = s.airsp_id \
					JOIN sua_airspace_type t ON t.airsp_type = s.airsp_type \
					WHERE a.airsp_name IS NULL ORDER BY s.airsp_name \
					&m=SUA no coords");

	function get_sua_nofeat() {
		var row = "";
		$.ajax({
			type: "Get",
			url: sua_nofeat,
			success: function(data) {
				$('#suatbl tbody').empty();
				$.each(data, function(index, features) {
					row += "<tr><td>" + features.airsp_id + "</td><td>"
						+ features.airsp_name + "</td><td>" 
						+ features.airsp_type_desc + "</td></tr>";
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
					LEFT JOIN circles c ON c.rep_num = s.rep_num \
					WHERE s.prod_id = 8 AND (SUBSTRING(s.stn_call, 1, 1) = ' ' \
					OR s.stn_call ='') 	AND g.rep_num IS NULL AND c.rep_num IS NULL \
					order by s.rep_num \
					&m=TFR no graphic");

	function get_tfr_nograph() {
		var row = "";
		$.ajax({
			type: "Get",
			url: tfr_nograph,
			success: function(data) {
				$('#tfrtbl tbody').empty();
				$.each(data, function(index, features) {
					row += "<tr><td>" + features.rep_num + "</td><td>"
						+ features.notam_name + "</td><td>"
						+ features.text_data + "</td></tr>";
				});
				$("#tfrtbl tbody").append(row);
			},
		});		
	};
	get_tfr_nograph();
});