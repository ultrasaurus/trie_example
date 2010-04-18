require 'rubygems'
require 'sinatra'
require '../trie_dictionary'
require '../names'

$data = Dictionary.new
$names.each do |name| 
  $data.add(name)
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


