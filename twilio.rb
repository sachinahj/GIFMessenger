require 'twilio-ruby'
require 'unirest'
require 'sinatra'

set :bind, '0.0.0.0'

giphy_key = "dc6zaTOxFJmzC"
giphy_base = "http://api.giphy.com/v1/gifs/search?q="

get '/' do
  search = params[:Body] || "funny cat"
  message_body = "Here is your #{search.downcase} GIF!!"


  url_search = search.gsub(" ", "%20")
  giphy_url = "#{giphy_base}#{url_search}&api_key=#{giphy_key}"

  response = Unirest.get(giphy_url)
  length = response.body['data'].length

  size = 800000
  n = 1
  while size > 750000
    random = rand(length)
    gif = response.body['data'][random]["images"]["original"]
    size = gif["size"].to_i
    gif_url = gif["url"]
    if n > 1000 || response.body['data'] == nil
      message_body = "No GIF was found with that search"
      gif_url = nil
      break
    end
    puts n
    n += 1
  end
  puts "gif url --> #{gif_url}"

  twiml = Twilio::TwiML::Response.new do |r|
      r.Message do |message|
        message.Body message_body
        if gif_url
          message.Media gif_url
        end
      end
  end

  twiml.text

end