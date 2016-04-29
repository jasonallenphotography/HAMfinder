get '/locations/new' do
  erb :'locations/new'
end

post '/locations' do
  @location = Location.new(params[:location])
  @location.user = current_user

  if @location.save
    redirect "/users/#{current_user.id}"
  else
    erb :'locations/new'
  end
end

get '/locations/:id/edit' do
  @location = Location.find(params[:id])
  erb :'locations/edit'
end

put '/locations/:id' do
  @location = Location.find(params[:id])
  @location.assign_attributes(params[:location])

  if @location.save
    redirect '/locations'
  else
    erb :'locations/edit'
  end

end

delete '/locations/:id' do
  @location = Location.find(params[:id])
  @location.destroy
  redirect '/locations'
end
