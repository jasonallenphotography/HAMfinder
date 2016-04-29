get '/users' do
  redirect_unless_logged_in
  redirect "/users/#{current_user.id}"
  # @users = User.all.order(created_at: :asc)
  # erb :'users/index'
end

get '/users/new' do
  redirect_if_already_logged_in

  erb :'users/new'
end

post '/users' do
  redirect_if_already_logged_in

  @user = User.new(params[:user])
  if @user.save
    redirect '/users'
  else
    erb :'users/new'
  end
end

get '/users/:id' do
  redirect_unless_logged_in

  @user = User.find(params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  redirect_unless_editing_or_deleting_own(@user.id)

  erb :'users/edit'
end

put '/users/:id' do
  @user = User.find(params[:id])
  redirect_unless_editing_or_deleting_own(@user.id)

  @user.assign_attributes(params[:user])
  if @user.save!
    redirect "/users/#{@user.id}"
  else
    erb :'users/edit'
  end
end

delete '/users/:id' do
  @user = User.find(params[:id])
  redirect_unless_editing_or_deleting_own(@user.id)

  @user.destroy
  redirect '/users'
end
