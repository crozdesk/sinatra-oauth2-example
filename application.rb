require 'sinatra'
require 'omniauth-crozdesk'

use OmniAuth::Builder do
  provider :crozdesk,
    'PROVIDER_KEY', # Provider key
    'PROVIDER_SECRET', # Provider secret
    callback_path: '/users/auth/crozdesk/callback'
end

configure do
  enable :sessions
end

get '/' do
  if session[:logged_in]
    <<-HTML
      <p>Hi, #{session[:email]}!</p>
      <p><a href='/logout'>Click here to logout.</a>
    HTML
  else
    <<-HTML
      <a href='/login'>Click here to login.</a>
    HTML
  end
end

get '/login' do
  redirect to('/auth/crozdesk')
end

get '/logout' do
  session.clear
  "You have been logged out."
end

get '/users/auth/crozdesk/callback' do
  if env['omniauth.auth']
    session[:logged_in] = true
    session[:email] = env['omniauth.auth']['info']['email']
  else
    halt(401, 'Not Authorized')
  end
  "Hi, #{session[:email]}!"
end

get '/auth/failure' do
  params[:message]
end
