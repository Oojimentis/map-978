// ** Map978 TAF Details Sceen.

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");
var thead = '';
var tbody = '';

var stn_sql = url.concat("SELECT t.stn_call, CONCAT(s.stn_loc,', ', s.state) AS stn_loc,\
			t.current, t.wind, t.visby, t.condx, t.rep_time, t.issued \
			FROM taf t INNER JOIN stations s ON s.stn_call = t.stn_call \
			ORDER BY t.stn_call \
			&m=TAF Details");

function getChildRow(callback,data) {

	var sub ='SELECT stn_call AS "Station", forecast AS "Forecast" \
				FROM taf_forecast \
				WHERE stn_call = \'' + data.stn_call + '\' AND \
				rep_time =\''+ data.rep_time+ '\' \
				&m=TAF child rows';
				
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
			$.each(sdata, function(i, d) {
				tbody += '<tr><td>' + d.Station
					+ '</td><td>' + d.Forecast
					+ '</td></tr>';
			});

			callback($('<table class="taf_child"'
				+ ' style="padding-left:50px;">' + thead + tbody + '</table>')).show();
		}
	});
}

$(document).ready(function() {
	$.ajax({
		type: "get",
		url: stn_sql,
		success: function(result) {
			var table=	$('#tableID').DataTable({
				destroy: true,
				data: result,
				pageLength: 10,
				lengthMenu: [5, 10, 25, 100, 500],
				columns: [{
					"className": 'details-control',
					"orderable": true,
					"data": null,
					"defaultContent": ''
				},	
					{ data: 'stn_call'},
//					{ data: 'stn_call',
//					render: function (data, type, row) {
//  return '<a href=page4?StnID="' + data + '">'+data+'</a>' 
//	return '<a href=page5?StnID="' + data + '" onClick="return popup(this,\'notes\')">'+data+' </a>'
//   } 
//					},
					{ data: 'stn_loc' },
					{ data: 'issued' },									
					{ data: 'current' },
					{ data: 'wind' },
					{ data: 'visby' },
					{ data: 'condx' }
				]
			});
			$('#tableID tbody').on('click','td.details-control', function() {
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
					getChildRow(row.child,row.data());
					// To show details,add the below class
					tr.addClass('shown');
				}
			});			
		}
	});
});
	