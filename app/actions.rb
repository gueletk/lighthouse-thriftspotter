# Homepage (Root path)
get '/' do
  erb :index
end
#
# password_digest, null: false
# session_token

get '/items/new' do
  @item = Item.new(
    title: params[:title],
    description: params[:description],
    image_path: params[:image_path],
    price: params[:price],
    location: params[:location],
    user_id: params[:user_id]
  )
  erb :'items/new'
end

post '/items/new' do
  @item = Item.new(
    title: params[:title],
    description: params[:description],
    image_path: params[:image_path],
    price: params[:price],
    location: params[:location],
    user_id: params[:user_id]
  )
  if @item.save
    redirect 'items/show'
  else
    redirect 'items/new'
end

get '/items/show' do
  erb :'items/show'
end

get '/users/signup' do
  erb :'users/signup'
end

get '/users/login' do
  erb :'users/login'
end

get '/users/profile' do
  erb :'users/profile'
end
