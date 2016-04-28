post '/csv' do
  @url = params[:url]
  create_csv_from_url(@url)

  redirect '/'
end
