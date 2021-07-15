var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");

var stn_sql = url.concat("select stn_call,current,wind,visby,condx,rep_time,issued from taf &m=page3");

/* Function for child row details*/

function getChildRow(callback) {

	var sub ='select stn_call,rep_time,forecast from taf_forecast \
				where stn_call = \'' + callback.stn_call + '\' and \
				rep_time =\''+ callback.rep_time+ '\' &m=subsql';
	var sub_sql = url.concat(sub);
		var thead = '',  tbody = '';

$.ajax({  
	type: "Get",
	url: sub_sql,
	success: function(sdata) {

		for (var key in sdata[0]) {
			thead += '<th>' + key + '</th>';
		}
		$.each(sdata, function (i, d) {
			tbody += '<tr><td>' + d.stn_call
				+ '</td><td>' + d.rep_time
				+ '</td><td>' + d.forecast
				+ '</td></tr>';
		});
		console.log('<table>' + thead + tbody + '</table>');
//		callback($('<table>' + thead + tbody + '</table>')).show();
	}

});
		return($('<table>' + thead + tbody + '</table>')).show();	
/*
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
		'</table>'
*/		
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
	