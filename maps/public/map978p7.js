// ** Map978 METAR Details Sceen.

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");
var thead = '';
var tbody = '';

var stn_sql = url.concat("SELECT t.stn_call, CONCAT(s.stn_loc,', ', s.state) AS stn_loc,\
			ob_date, CONCAT(temperature,'/',dewp) as temperature, concat(windsp,'kts <br>',winddir,'deg') as windsp, \
			concat(altimeter,'<br>',slp) as slp, visby, dewp, hrly_precip,\
			windvar, windgust, mtype, concat(cld_type1,'<br>', cld_type2,'<br>', cld_type3,'<br>', cld_type4, '<br>',cld_type5) as cld_type1,\
			wx_obstruct FROM postgis.metar t \
			INNER JOIN (select stn_call, MAX(ob_date) AS mob FROM metar GROUP BY stn_call) \
			g ON t.stn_call = g.stn_call AND t.ob_date = g.mob \
			INNER JOIN stations s ON s.stn_call = t.stn_call \
			ORDER BY t.stn_call \
			&m=METAR Details");

$(document).ready(function() {
	$.ajax({
		type: "get",
		url: stn_sql,
		success: function(result) {
			var table=	$('#tableID').DataTable({
				destroy: true,
				data: result,
				pageLength: 25,
				lengthMenu: [10, 25, 50, 100, 250, 500],
				columns: [ 
					{ "width": "1px",
						data: 'stn_call'},
					{ "width": "5px",data: 'stn_loc' },
					{"width": "42px", data: 'ob_date' },									
					{ "width": "5px",data: 'mtype' },
					{ "width": "1px",data: 'temperature' },
					{ data: 'windsp' },
					{ data: 'windvar' },
					{ "width": "5px",data: 'windgust' },					
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
