// ** Map978 METAR line Graph

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");

const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
var stnid = urlParams.get('StnID');
var stnid1 = stnid.replace(/"/g, "'");

stnid = stnid.replace(/['"]+/g, '');

var stn_sql = url.concat(`SELECT stn_call, temp, ob_date FROM metar \
			WHERE stn_call = ${stnid1} ORDER BY ob_date \
			&m=METAR METAR Graph`);

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
					borderColor: 'yellow',
					hoverBackgroundColor: 'green',
					hoverBorderColor: 'rgba(200, 200, 200, 1)',
					data: tmp
				}]
			};
			var ctx = $("#mycanvas");

			var barGraph = new Chart(ctx, {
				type: 'line',
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
							text: 'Temperature at Station '+stnid
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