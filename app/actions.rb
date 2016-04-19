# Homepage (Root path)
get '/' do
  erb :index
end
# 
# password_digest, null: false
# session_token

get '/items/new' do
  erb :'items/new'
end

get '/items/show' do
  erb :'items/show'
end