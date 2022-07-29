// ** Map978 METAR Details Sceen.

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");
var thead = '';
var tbody = '';

var stn_sql = url.concat("SELECT t.stn_call, CONCAT(s.stn_loc,', ', s.state) AS stn_loc,\
			ob_date, temperature, windsp, winddir, altimeter, visby, dewp, hrly_precip, slp,\
			windvar, windgust, mtype, cld_type1, cld_type2, cld_type3, cld_type4, cld_type5,\
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
					{ data: 'stn_call'},
					{ data: 'stn_loc' },
					{ data: 'ob_date' },									
					{ data: 'mtype' },
					{ data: 'temperature' },
					{ data: 'dewp' },
					{ data: 'windsp' },
					{ data: 'winddir' },
					{ data: 'windvar' },
					{ data: 'windgust' },					
					{ data: 'altimeter' },
					{ data: 'slp' },					
					{ data: 'visby'},
					{ data: 'hrly_precip' },									
					{ data: 'wx_obstruct' },
					{ data: 'cld_type1'},
					{ data: 'cld_type2'},
					{ data: 'cld_type3'},
					{ data: 'cld_type4'},
					{ data: 'cld_type5'}				
				]
			});
		}
	});
});
