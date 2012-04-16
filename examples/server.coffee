express			= require 'express'
ndj 				= require 'newdelimma'

app = module.exports = express.createServer()

app.configure ->
	app.use ndj.middleware( { handle: 'update'} )
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use express.cookieParser()
	app.use app.router

app.post '/', (req, res) ->
	console.log req.body
	res.send 200

app.listen 3000
console.log 'listening on port 3000'