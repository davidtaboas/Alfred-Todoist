# encoding: utf-8
require 'net/http'
require 'json'

# Add your code language here  (valid languages are: en, da, pl, zh, ko, de, pt, ja, it, fr, sv, ru, es, nl).

date_lang = "es"

# Add your key here
token = ""

query = "{query}"


string = /([^>]+)( > (.*))?$/.match(query)

uri = URI('https://api.todoist.com/API/addItem')
params = {
  :content     => string[1],
  :date_lang   => date_lang,
  :token       => token
}

unless string[3].nil?
  params.merge!(:date_string => string[3])
end

uri.query = URI.encode_www_form(params)

res = Net::HTTP.get_response(uri)

puts JSON.parse(res.body)["content"] if res.is_a?(Net::HTTPSuccess)