get '/locations/new' do
  redirect_unless_logged_in

  if request.xhr?
    "OK"
  else
    erb :'locations/new'
  end
end

get '/locations/download' do
  redirect_unless_logged_in

  erb :'locations/download'
end

post '/locations' do
  redirect_unless_logged_in

  @location = Location.new(params[:location])
  @location.user = current_user

  if @location.save
    if request.xhr?
      "#{erb :'locations/_location.html', layout: false, locals: { location: @location }}"
    else
      redirect "/users/#{current_user.id}"
    end
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
    if request.xhr?
      "#{erb :'locations/_location.html', layout: false, locals: { location: @location }}"
    else
      redirect "/users/#{current_user.id}"
    end
  else
    erb :'locations/edit'
  end

end

delete '/locations/:id' do
  @location = Location.find(params[:id])
  @location.destroy
  redirect "/users/#{current_user.id}"
end
