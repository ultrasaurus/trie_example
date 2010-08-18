require 'rubygems'
require 'sinatra'
require '../dictionary'
require '../names'
require 'json'

$data = Dictionary.new
$names.each do |name| 
  $data.add(name)
end

get '/test' do
  erb :test
end

get '/foo' do
  "hello"
end

get '/' do
  erb :home
end

get '/words' do
  puts "------------------ words"
  prefix = params[:q]
  prefix.capitalize!
  puts "------ #{prefix}"
  words = $data.find(prefix)
  puts words.inspect
  words.inject("") do |list, word|
    list + "#{word}|#{word.upcase}\n"
  end

end

#get '/words.json' do
#  puts "------------------ words"
#  prefix = params[:q]
#  prefix.capitalize!
#  puts "------ #{prefix}"
#  words = $data.find(prefix)
#  words.to_json
#end

