// ** Map978 Station Lookup.

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");

var stn_sql = url.concat("SELECT stn_call, stn_loc, state \
			FROM stations \
			ORDER BY stn_call \
			&m=Station Lookup");

function popup(mylink, windowname) {
	if (! window.focus)return true;
		var href;
	if (typeof(mylink) == 'string') href = mylink;
		else href=mylink.href;
		
	window.open(href, windowname, 'width=750, height=500, scrollbars=no');
	return false;
}

$(document).ready(function() {
	$.ajax({
		type: "get",
		url: stn_sql,
		success: function(result) {
			var table = $('#tableID').DataTable({
				orderCellsTop: true,
				fixedHeader: true,
				destroy: true,
				data: result,
				pageLength: 10,
				lengthMenu: [5, 10, 25, 100, 500],
				columns: [	
					{data: 'stn_call',
						createdCell: function (td, stn_call, result, Row, Col) {
							$(td).html('<a href=page6?StnID="'+ stn_call 
							+'" onClick="return popup(this,\'notes\')">'
							+ stn_call+' </a>');
						}
					},
					{ data: 'stn_loc' },
					{ data: 'state' }
				]
			});
		}
	});
});