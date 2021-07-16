var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");

var stn_sql = url.concat("select stn_call, current, wind, visby, condx, rep_time, issued from taf &m=page3");
var thead = '';
var tbody = '';

function getChildRow(callback,data) {

	var sub ='select stn_call as "Station",rep_time as "Time",forecast as "Forecast" from taf_forecast \
		where stn_call = \'' + data.stn_call + '\' and \
		rep_time =\''+ data.rep_time+ '\' &m=subsql';
	var sub_sql = url.concat(sub);
		$.ajax({  
			type: "Get",
			url: sub_sql,
			success: function(sdata) {
				var thead = ''; 
		 		var tbody = '';
				for (var key in sdata[0]) {
					thead += '<th>' + key + '</th>';
				}
				$.each(sdata, function (i, d) {
					tbody += '<tr><td>' + d.Station
						+ '</td><td>' + d.Time
						+ '</td><td>' + d.Forecast
						+ '</td></tr>';
				});

				callback($('<table cellpadding="5" cellspacing="0"'
					+ ' style="padding-left:50px;">' + thead + tbody + '</table>')).show();
			}
		});
}

$(document).ready(function () {
	$.ajax({
		type: "get",
		url: stn_sql,
		success: function(result) {
			var table=	$('#tableID').DataTable({
				data: result,
				columns: [{
					"className": 'details-control',
					"orderable": true,
					"data": null,
					"defaultContent": ''
				},					
					{ data: 'stn_call' },
					{ data: 'current' },
					{ data: 'wind' },
					{ data: 'visby' },
					{ data: 'condx' }
				]
			});
			$('#tableID tbody').on('click','td.details-control', function () {
				var tr = $(this).closest('tr');
				var row = table.row(tr);
				if (row.child.isShown()) {
					// Closing the already opened row           
					row.child.hide();
					// Removing class to hide
					tr.removeClass('shown');
				}
				else {
					// Show the child row for detailinformation
//					row.child(getChildRow(row.data())).show();
				getChildRow(row.child,row.data());
					// To show details,add the below class
					tr.addClass('shown');
				}
			});			
		}
	});
});
	