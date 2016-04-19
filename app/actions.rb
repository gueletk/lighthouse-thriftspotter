# Homepage (Root path)
require 'securerandom'

def user_authenticate!
  redirect '/login' unless session.has_key?(:session_token)
  if !session.has_key?(:user_session) || !User.find_by_session_token(session[:session_token])
    redirect '/login'
  end
end

get '/' do
  erb :index
end

post '/signup' do
  @user = User.new(
    username: params[:username],
    name: params[:name]
    )
end

get '/' do
  redirect '/protected'
end

get '/login' do
  erb :index
end

get '/protected' do
  user_authenticate!
end

get '/401' do
  erb :fail401
end

post '/session' do
  user = User.find_by_email(params[:email].downcase)
  if user && user.authenticate(params[:password])
    session[:session_token] = SecureRandom.urlsafe_base64()
    user.update!(session_token: session[:session_token])
    redirect '/protected'
  else
    redirect '/401'
  end
end

get '/session/sign_out' do
  User.find_by_session_token(session[:session_token]).update!(session_token: nil)
  session.clear
  redirect '/login'
end
#
# password_digest, null: false
# session_token
