require 'bundler'
Bundler.require

get '/' do
  "Asere"
end

post '/mira' do
  content_type :json

  @body = params['Body']

  @image = HTTParty.get(params['MediaUrl0'], follow_redirects: true)
  @image = @image.request.last_uri.to_s

  @upload_image = Cloudinary::Uploader.upload(@image)

  @bot_payload = {
    text: @upload_image['url'],
    channel: "#botdev"
  }

  logger.info @bot_payload

  @to_slack = HTTParty.post(ENV['SLACK_HOOK'], { 
    :body => @bot_payload.to_json,
    :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
  })

  logger.info @to_slack

  @resp = {
    meta: {
      code: 200
    }
  }

  @resp.to_json
end