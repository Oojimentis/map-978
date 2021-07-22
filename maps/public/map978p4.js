// ** Map978 Graph Test

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");

var stn_sql = url.concat("select stn_call, temp, ob_date \
					from metar \
					where stn_call = 'K1P1' &m=Station graph");

$(document).ready(function() {
	$.ajax({
		type: "get",
		url: stn_sql,
		success: function(data) {
			var obs =[];
			var tmp = [];
		
			for(var i in data) {
				obs.push(data[i].ob_date);
				tmp.push(data[i].temp);
			}
			var chartdata = {
				labels: obs,
				datasets : [{
					label: 'Temperature',
					backgroundColor: 'yellow',
					borderColor: 'blue',
					hoverBackgroundColor: 'rgba(200, 200, 200, 1)',
					hoverBorderColor: 'rgba(200, 200, 200, 1)',
					data: tmp
				}]
			};
			var ctx = $("#mycanvas");

			var barGraph = new Chart(ctx, {
				type: 'bar',
				data: chartdata,
				options: {
					responsive: true,
					plugins: {
						legend: {
							position: 'bottom',
							align: 'start'
						},
						title: {
							position: 'top',
							display: true,
		                    font: {
								size: 18
                    		},
							text: 'Temperature at Station'
							
						}
					}
				},
			});
		},
		error: function(data) {
			console.log(data);
		}
	});
});