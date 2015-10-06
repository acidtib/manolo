var express = require('express')
  , app = express()
  , port = process.env.PORT || 3000

var logger = require('express-logger');
app.use(logger({path: "log.txt"}));

app.get('/', function(request, response) {
  response.send('Hello World!')
})

app.post('/mira', function(request, response) {

  console.log('-------------------');
  console.log(response.Body);

  // var text_body = response;

  // intake sms from twilio

  // save image localy

  // set up call to slack

  // make call to slack




  var response_payload = {
    "meta": {
      "code": 200
    }
  };

  response.json(response_payload);
})

app.listen(port, function() {
  console.log('Listening on port ' + port)
})
