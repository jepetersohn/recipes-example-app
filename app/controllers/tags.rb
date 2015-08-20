get "/tags/:id" do
  @tag = Tag.find(params[:id])
  erb :"tags/show"
end