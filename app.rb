require 'bundler'
Bundler.require

get '/' do
  "Asere"
end

post '/mira' do
  content_type :json

  logger.info  params['MessageSid']

  @body = ""
  @image = ""

  @resp = {
    meta: {
      code: 200
    }
  }

  @resp.to_json
end