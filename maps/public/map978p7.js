// ** Map978 METAR Details Sceen.

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");

var stn_sql = url.concat("SELECT t.stn_call, CONCAT(s.stn_loc,', ', s.state) AS stn_loc, ob_date, \
CONCAT( \
	CASE WHEN temperature <> '- ' THEN CONCAT('Tp: ', temperature, '°F <BR>') ELSE temperature END, \
	CASE WHEN dewp <> '-' THEN CONCAT('Dp: ', dewp,'°F') ELSE dewp END) AS temperature, \
CONCAT( \
	(CASE WHEN windsp <> '-' THEN CONCAT('Spd: ', windsp, ' kts<BR>') ELSE windsp END), \
	(CASE WHEN winddir = 'Variable' THEN CONCAT('Dir: ', winddir, '<BR>') \
		  WHEN winddir <> '-' THEN CONCAT('Dir: ', winddir, 'deg<BR>') ELSE winddir END), \
	(CASE WHEN windgust <> '-' THEN CONCAT('Gust: ', windgust, ' kts') ELSE windgust END)) AS windsp, \
CONCAT( \
	CASE WHEN altimeter <> '-' THEN CONCAT('Alt: ',altimeter, ' Ins<BR>') ELSE altimeter END, \
	CASE WHEN slp <> '-' THEN CONCAT('SLP: ',slp,' hPa') ELSE slp END) AS slp, \
CONCAT( \
	CASE WHEN visby <> '-' THEN CONCAT('Vis: ',visby,' sm<BR>') ELSE visby END ,\
   (CASE WHEN hrly_precip <> '- ' THEN CONCAT('Precip: ',hrly_precip,'in/hr<BR>') \
	ELSE CONCAT(hrly_precip,'<BR>') END), wx_obstruct) AS wx_obstruct, \
	mtype, \
CONCAT(cld_type1, '<BR>', cld_type2,'<BR>', cld_type3, '<BR>', cld_type4, '<BR>', cld_type5) AS cld_type1 \
FROM postgis.metar t \
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
					{ "width": "95px", data: 'stn_loc' },
					{ "width": "42px",data: 'ob_date' },									
					{ "width": "5px", data: 'mtype' },
					{ "width": "1px", data: 'temperature' },
					{ "width": "70px",data: 'windsp' },
					{ "width": "90px",data: 'slp' },					
					{ "width" : "80px",data: 'wx_obstruct' },
					{ data: 'cld_type1'}
				]
			});
		}
	});
});
