var express = require('express')
var app = express()

app.set('port', (process.env.PORT || 5000))

app.get('/', function(request, response) {
  response.send('Hello World!')
})

app.get('/mira', function(request, response) {

  console.log(response);
  console.log('-------------------');
  console.log(response.body);

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

app.listen(app.get('port'), function() {
  console.log("Listening on port:" + app.get('port'))
})