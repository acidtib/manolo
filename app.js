var express = require('express')
  , app = express()
  , port = process.env.PORT || 3000

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

app.listen(port, function() {
  console.log('Listening on port ' + port)
})