# Homepage (Root path)
require 'pry'

def get_file_name(title, image_name)
  name = title.gsub(/\s+/,'_').downcase
  extension = /\..*/.match(image_name)[0]
  timestamp = Time.now.getutc.to_i.to_s
  "./public/images/#{name}_#{timestamp}#{extension}"
end

get '/' do
  @items = Item.all
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
    price: params[:price],
    image_path: get_file_name(params[:title], params[:image][:filename]),
    location: params[:location],
    user_id: params[:user_id]
  )

  file = params[:image][:tempfile]

  File.open(@item.image_path, 'wb') do |f|
    f.write(file.read)
  end

  if @item.save
    redirect '/'
  else
    redirect 'items/new'
  end
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
