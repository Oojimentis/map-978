// ** Map978 METAR line Graph

var server_port = document.getElementById('port').value;
var host_url = "http://localhost:";
var url = host_url.concat(server_port, "/sqlx?q=");

const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
var stnid = urlParams.get('StnID');

stnid = stnid.replace(/"/g, "'");
//stnid = stnid.concat("'");

var stn_sql = url.concat(`SELECT stn_call, temperature, windsp, ob_date, altimeter FROM metar \
			WHERE stn_call = ${stnid} ORDER BY ob_date \
			&m=METAR METAR Graph`);

$(document).ready(function() {
	$.ajax({
		type: "get",
		url: stn_sql,
		success: function(data) {
			var obs =[];
			var tmp = [];
			var windsp = [];
			var alt = [];
					
			for(var i in data) {
				obs.push(data[i].ob_date);
				tmp.push(data[i].temperature);
				windsp.push(data[i].windsp);
				alt.push(data[i].altimeter);
			}
			var chartdata = {
				labels: obs,
				datasets : [
				{
					label: 'Temperature',
					backgroundColor: 'blue',
					borderColor: 'blue',
					hoverBackgroundColor: 'green',
					hoverBorderColor: 'rgba(200, 200, 200, 1)',
					data: tmp,
					yAxisID: 'y',
				},
				{
					label: 'Wind Speed',
					backgroundColor: 'red',
					borderColor: 'red',
					hoverBackgroundColor: 'green',
					hoverBorderColor: 'rgba(200, 200, 200, 1)',
					data: windsp,
					yAxisID: 'y1',
				},
				{
					label: 'Altimeter',
					backgroundColor: 'cyan',
					borderColor: 'cyan',
					hoverBackgroundColor: 'green',
					hoverBorderColor: 'rgba(200, 200, 200, 1)',
					data: alt,
					yAxisID: 'y2',
				}
				]
			};
			var ctx = $("#mycanvas");

			var barGraph = new Chart(ctx, {
				type: 'line',
				data: chartdata,
				options: {
					responsive: true,
					interaction: {
						mode: 'index',
						intersect: false,
					},
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
							text: 'METAR Station ' + stnid
						}
					},
					scales: {
						y: {
							type: 'linear',
							display: true,
							position: 'left',
						},
						y2: {
							type: 'linear',
							display: true,
							position: 'right',
							// grid line settings
							grid: {
								drawOnChartArea: false, // only want the grid lines for one axis to show up
							},
						},
						y1: {
							type: 'linear',
							display: true,
							position: 'right',
							// grid line settings
							grid: {
								drawOnChartArea: false, // only want the grid lines for one axis to show up
							},
						},
					}
				},
			});
		},
		error: function(data) {
			console.log(data);
		}
	});
});