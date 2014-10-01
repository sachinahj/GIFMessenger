require 'unirest'

url = "http://api.giphy.com/v1/gifs/search?q=funny%20cat&api_key=dc6zaTOxFJmzC"
response = Unirest.get(url)
length = response.body['data'].length
size = 800000

while size > 750000
  random = rand(length)
  gif = response.body['data'][random]["images"]["original"]
  size = gif["size"].to_i
  gif_url = gif["url"]
end

puts gif
puts "\n"
puts gif_url
puts size
