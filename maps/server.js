require('dotenv').config();

const express = require('express')
const app = express()

var pgp = require("pg-promise")(),
 	dbgeo = require("dbgeo");

//var port = 4000;
var port = process.env.POSTGRESQL_PORT;
var connectionString = process.env.POSTGRESQL_CONNECT ;

var db = pgp(connectionString) ;

app.set('view engine', 'ejs')
app.use(express.static('public'));

//route to the root 



app.get('/',function (req, res) { 
	res.render('index' ,{ ptnum: port});
});

app.get('/page2', function(req, res) {
   res.render('page2',{ ptnum: port});
}); 


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

// server port connection
app.listen(port, ()=> console.log('app is running on port',port));
