require 'bundler'
Bundler.require

get '/' do
  "Asere"
end

post '/mira' do
  content_type :json

  logger.info "#{params}"

  @body = params['Body']
  @image = param['MediaUrl0']

  @bot_payload = {
    text: "Asere ponte pa la cosa",
    channel: "#botdev",
    attachments: {
      fallback: "deja el drama",
      color: "#D00000",
      image_url: @image
    }
  }

  @to_slack = HTTParty.post(ENV['SLACK_HOOK'], { 
    :body => @bot_payload.to_json,
    :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
  })

  @resp = {
    meta: {
      code: 200
    }
  }

  @resp.to_json
end