# Newdelimma
      
  
  Very basic middleware for Connect/Express to handle newline-delimited javascript requests

## Installation

    $ npm install newdelimma

## Comments

The specifications for newline-delimited JSON (NDJ) are in draft stages as of early 2012.
http://en.wikipedia.org/wiki/User:Baxter.brad/Drafts/JSON_Document_Streaming_Proposal#Newline-delimited_JSON

At this point, NDJ headers often fall under the same umbrella as standard JSON: 'application/json'
	
	This middleware intercepts 'application/json' POST requests, and converts NDJ into standard JSON.

		{ "field1": "value1", "field2": "value2", "field3": "value3" }
		{ "fieldA": "valueA", "fieldB": "valueB", "fieldC": "valueC" }

are instead converted to

		{
			record1:	{ "field1": "value1", "field2": "value2", "field3": "value3" },
			record2:	{ "fieldA": "valueA", "fieldB": "valueB", "fieldC": "valueC" }
		}

"record" can be changed by passing { handle: "mycustomrecord" } as an option

## Usage

Should come BEFORE bodyParser in the express middleware stack (listed in CoffeeScript below):

	app.configure ->
		app.use express.logger( { format: '\x1b[1m:method\x1b[0m \x1b[32m:url\x1b[0m :response-time ms' } )
		app.use ndj.middleware()
		app.use express.bodyParser()
		app.use express.methodOverride()
		app.use express.cookieParser()

