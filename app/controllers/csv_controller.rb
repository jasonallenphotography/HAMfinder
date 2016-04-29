post '/csv' do
  @url = params[:url]
  @location = params[:location]
  create_csv_from_url(@url)

  if request.xhr?
    "OK"
  else
    redirect '/locations/download'
  end

end
