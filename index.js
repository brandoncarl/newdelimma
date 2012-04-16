/*!
 * Newline Delimited JSON handler
 * Copyright(c) 2012 Brandon Carl
 * MIT Licensed
 */

newdelimma  = module.exports = {};

/**
 * Intercepts 'application/json' requests
 */

newdelimma.middleware = function (options){
  options = options || {};
  return function middleware(req, res, next) {
    if (req.body) return next();

    if ('GET' == req.method || 'HEAD' == req.method) return next();
    if ('application/json' === mime(req)) {
      parseNDJ(req, options, next);
    } else {
      next();
    }
  }
};


/**
 * Parses both standard JSON and newline delimited JSON requests
 */

function parseNDJ = function(req, options, fn){
  var buf = '';

  req.setEncoding('utf8');

  // aggregate all information in the request
  req.on('data', function(chunk){ buf += chunk });

  req.on('end', function(){
    try {
      if (buf.length) {

        // regular expression to detect NDJ
        var re  = new RegExp('} *[\r\n] *{');

        if (buf.match(re)) {      // is NDJ
          var bufArray = new Array();
          var lines = buf.replace(re, '}\n{').split('\n');
          for (var i = 0, len = lines.length; i < len; i++) {
            bufArray.push('"record' + i + '": ' + lines[i]);
          }
          req.body = JSON.parse('{' + bufArray.join(', ') + '}');
        } else {                  // is standard JSON
          req.body = JSON.parse(buf);
        }
      } else {
        req.body = {};
      }
      fn();
    } catch (err){
      fn(err);
    }
  });
};

function mime(req) {
  var str = req.headers['content-type'] || '';
  return str.split(';')[0];
}