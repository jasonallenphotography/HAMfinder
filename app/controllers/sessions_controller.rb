enable :sessions

get '/login' do
  erb :'sessions/login'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:id] = user.id

    redirect "/users/#{user.id}"
  else
    erb :'sessions/login'
  end
end

delete '/logout' do
  session.clear
  redirect '/'
end
