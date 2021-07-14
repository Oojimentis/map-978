var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");

var stn_sql = url.concat("select stn_call,ob_date,temp,windsp from metar  &m=page3");

$(document).ready(function () {
	$.ajax({
		type: "get",
		url: stn_sql,
		success: function(result) {
			$('#tableID').DataTable({
				data: result,
				columns: [{
					"className": 'details-control',
					"orderable": true,
					"data": null,
					"defaultContent": ''
				},					
					{ data: 'stn_call' },
					{ data: 'ob_date' },
					{ data: 'temp' },
					{ data: 'windsp' }
				]
			});
		}
	});	
});
	