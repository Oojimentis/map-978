var serv_port = document.getElementById('port').value;
var url1 = "http://localhost:";
var url = url1.concat(serv_port, "/sql?q=");

// NEXRAD Count
$(document).ready(function(){
	setInterval(gettext,30000);

	var sqltext = 'http://localhost:8000/sqlx?q=SELECT prod_id, fisb_product_desc, \
					altitude, COUNT(*) AS count FROM nexrad, fisb_products WHERE prod_id = fisb_product_id \
					GROUP BY prod_id, fisb_product_desc, altitude ORDER BY prod_id, altitude';

	function gettext(){
		var row = "";

		$.ajax({
			type: "Get",
			url: sqltext,
			success: function (data){
				$('#stntbl tbody').empty();
				$.each(data, function (index, features){
					row += "<tr><td>" + features.fisb_product_desc + "</td><td>" 
					+ features.altitude + "</td><<td>" 
					+ features.count + "</td></tr>";
				});
				$("#stntbl tbody").append(row);
			},
		});		
	};
	gettext();
});

// SUA no coords
$(document).ready(function(){
	setInterval(getsua,57000);

	var sqltextsua = 'http://localhost:8000/sqlx?q=SELECT DISTINCT s.airsp_id, s.airsp_name, s.airsp_type \
					FROM sua s LEFT JOIN sua_airspace a ON a.airsp_id = s.airsp_id \
					WHERE a.airsp_name IS NULL ORDER BY s.airsp_name';

	function getsua(){
		var row = "";

		$.ajax({
			type: "Get",
			url: sqltextsua,
			success: function (data){
				$('#suatbl tbody').empty();
				$.each(data, function (index, features) {
					row += "<tr><td>" + features.airsp_id + "</td><td>" 
					+ features.airsp_name + "</td><<td>" 
					+ features.airsp_type + "</td></tr>";
				});
				$("#suatbl tbody").append(row);
			},
		});		
	};
	getsua();
});


// ** NOTAM TFR 
$(document).ready(function(){
	setInterval(gettfr,57000);

	var sqltexttfr = "http://localhost:8000/sqlx?q=SELECT s.rep_num, text_data, notam_name FROM sigairmet s \
			LEFT JOIN graphics g ON g.rep_num = s.rep_num \
			WHERE s.prod_id = 8 AND (SUBSTRING(s.stn_call,1,1) = ' ' OR s.stn_call ='') \
			AND g.rep_num IS NULL";

	function gettfr(){
		var row = "";

		$.ajax({
			type: "Get",
			url: sqltexttfr,
			success: function (data){
				$('#tfrtbl tbody').empty();
				$.each(data, function (index, features) {
					row += "<tr><td>" + features.rep_num + "</td><td>" 
					+ features.notam_name + "</td><<td>" 
					+ features.text_data + "</td></tr>";
				});
				$("#tfrtbl tbody").append(row);
			},
		});		
	};
	gettfr();
});