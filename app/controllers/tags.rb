get "/tags/:name" do
  @tag = Tag.find_by(name: params[:name])
  if @tag
    erb :"tags/show"
  else
    404
  end
end