require 'bundler'
Bundler.require

get '/' do
  "Asere"
end

post '/mira' do
  content_type :json

  @body = ""
  
  if params['Body']
    @body = params['Body']
  end

  if params['MediaUrl0']
    @image = HTTParty.get(params['MediaUrl0'], follow_redirects: true)
    @image = @image.request.last_uri.to_s

    @upload_image = Cloudinary::Uploader.upload(@image)

    @body = "#{@body}" + "\n" + @upload_image['url']
  end

  @bot_payload = {
    text: @body,
    channel: "#general"
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