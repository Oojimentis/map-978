// ** Map978 METAR Details Sceen.

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");

var stn_sql = url.concat("SELECT t.stn_call, CONCAT(s.stn_loc,', ', s.state) AS stn_loc, \
	ob_date, \
	CONCAT('Tp: ', temperature, '°F <BR>Dp: ', dewp,'°F') AS temperature, \
	CONCAT( \
		(CASE WHEN windsp <> '-' THEN CONCAT('Sp: ', windsp, ' kts<br>') \
		 ELSE windsp END), \
		(CASE WHEN winddir = 'Variable' THEN concat('Dir: ', winddir, '<BR>') \
			  WHEN winddir <> '-' THEN concat('Dir: ', winddir, 'deg<BR>') \
	  		  ELSE winddir END), \
		(CASE WHEN windgust <> '-' THEN CONCAT('Gust: ', windgust, ' kts') \
		 ELSE windgust END)) AS windsp, \
	CONCAT(altimeter, ' Ins<BR>', slp,' hPa') AS slp, \
		CASE WHEN visby <> '-' THEN concat(visby,' sm') \
		ELSE visby END AS visby, \
	hrly_precip, mtype, \
	CONCAT(cld_type1, '<BRr>', cld_type2,'<BR>' , cld_type3,'<BRr>', \
		   cld_type4, '<BRr>', cld_type5) AS cld_type1, \
	wx_obstruct FROM postgis.metar t \
	INNER JOIN stations s ON s.stn_call = t.stn_call \
	ORDER BY t.stn_call \
	&m=METAR Details");

$(document).ready(function() {
	$.ajax({
		type: "get",
		url: stn_sql,
		success: function(result) {
			var table =	$('#tableID').DataTable({
				destroy: true,
				data: result,
				pageLength: 25,
				lengthMenu: [10, 25, 50, 100, 250, 500],
				columns: [ 
					{ "width": "1px", data: 'stn_call'},
					{ "width": "45px", data: 'stn_loc' },
					{ "width": "42px",data: 'ob_date' },									
					{ "width": "5px", data: 'mtype' },
					{ "width": "1px", data: 'temperature' },
					{ data: 'windsp' },
					{ data: 'slp' },					
					{ data: 'visby'},
					{ "width": "5px",data: 'hrly_precip' },									
					{ data: 'wx_obstruct' },
					{ data: 'cld_type1'}
				]
			});
		}
	});
});
