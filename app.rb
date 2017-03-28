require('sinatra')
require('sinatra/reloader')
require('./lib/retail')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/results') do
  @item = params.fetch('item')
  @sales = @item.totalKSH()[:total_KSH]
  @largest = @item.totalKSH()[:largest]

  erb(:results)
end
