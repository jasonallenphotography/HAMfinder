post '/csv' do
	zip = params[:zip]
  # @location = params[:location]
  create_csv_from_zip(zip, current_user)

  if request.xhr?
    "OK"
  else
    redirect '/locations/download'
  end

end
