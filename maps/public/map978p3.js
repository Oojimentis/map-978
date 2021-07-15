var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");

var stn_sql = url.concat("select stn_call,current,wind,visby,condx,rep_time,issued from taf &m=page3");

/* Function for child row details*/

function getChildRow(data) {
           
// `data` is the data object for the row
	return '<table cellpadding="5" cellspacing="0"'
		+ ' style="padding-left:50px;">' +
		'<tr>' +
		'<td>Station:</td>' +
		'<td>' + data.stn_call + '</td>' +
		'</tr>' +
		'<tr>' +
		'<td>Report Time:</td>' +
		'<td>' + data.rep_time + '</td>' +
		'</tr>' +
		'<tr>' +
		'<td>Issued At:</td>' +
		'<td>' + data.issued + '</td>' +
		'</tr>' +
		'</table>';
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
					row.child(getChildRow(row.data())).show();

					// To show details,add the below class
					tr.addClass('shown');
				}
			});			
		}
	});
});
	