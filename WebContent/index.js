// Dependencies
var express = require("express"),
	pgp = require("pg-promise")(),
	dbgeo = require("dbgeo");
// CORS
var allowCrossDomain = function(req,res,next) {
	res.header( "Access-Control-Allow-Origin","*") ;
	res.header( "Access-Control-Allow-Methods","GET") ;
 	res.header( "Access-Control-Allow-Headers","Content-Type");
 	next() ;
}
// Create express app and prepare db connection
var app = express() ;
var port = 4000;
var connectionString = "postgres://trev:moose@localhost:5432/uat978" ;
var db = pgp(connectionString) ;

app.use(allowCrossDomain) ;

// Expose sql endpoint, grab query as URL parameter and send it to the database
app.get( "/sql", function(req, res) {
 	var sql = req.query.q;
 	console.log("Executing SQL:" + sql) ;
 
//query using pg- promise
	db.any(sql)
 	.then(function (data) { //use dbgeo to convert WKB from PostGIS into topojson
 return dbGeoParse(data) ;
 	})
 	.then(function (data) {
 		res.send(data) ;
 	})
 	.catch( function (err) { //send the error message if the query didn't work
 	var msg = err.message || err;
	console.log( "ERROR:" , msg) ;
 	res.send( {
 		error: msg
 	}) ;
  }) ;
}) ;

// Parse to GeoJSON
function dbGeoParse(data) {
 	return new Promise( function (resolve, reject) {
 		dbgeo.parse(data, {
 			outputFormat: "geojson"
 		}, function (err, result) {
 			if(err) {
 				reject(err) ;
 			} else {
  				resolve(result) ;
 			}
 		}) ;
 	}) ;
}

// Start the server
var server = app.listen(port, "0.0.0.0" , function () {
 	var host = server.address().address;
 	var port = server.address().port;
 	console.log( "App listening at http://%s:%s" , host, port) ;
}) ;


