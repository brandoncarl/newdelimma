http 			= require 'http'

data = '{ "test": "Hello World" }\n{ "test2": "Hello Again" }    \n\n\n { "test2": "Hello Again" }\n \n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }\n{ "test2": "Hello Again" }'

options =
	host		: 'localhost'
	port 		: '3000'
	path 		: '/'
	method	: 'POST'
	headers	:
		'Content-Type'	:	'application/json'
		'Content-Length':	data.length

req = http.request options, (res) ->
	res.setEncoding 'utf8'

	res.on 'data', (chunk) ->
		console.log chunk

req.write data
req.end()