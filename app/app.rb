require 'rubygems'
require 'sinatra'

get '/' do
  erb :home
end

get '/names' do
  words = %w[frog fiend friend]
  words.inject("") do |list, word|
    list + "#{word}|#{word.upcase}\n"
  end

end


