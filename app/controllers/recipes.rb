# GET - reading things
# POST - creating things
# PUT - updating data
# DELETE - for deleting things silly

# ALL Routes will start with the name of the resource collection
# /recipes
# Routes referring to single recipes will use:
# /recipes/:id
# Edit and New are special... they deviate from this convention a tiny bit
# /recipes/new
# /recipes/:id/edit

# INDEX
get "/recipes" do
  @recipes = Recipe.order(:id).all
  erb :all_recipes
end

# NEW
get "/recipes/new" do
  @recipe = Recipe.new
  erb :new_recipe_form
end

# CREATE
post "/recipes" do
  @recipe = Recipe.new(title: params[:title],
                          ingredients: params[:ingredients],
                          description: params[:description])
  if @recipe.save
    redirect "/recipes/#{@recipe.id}"
  else
    erb :new_recipe_form
  end

end

# SHOW
get "/recipes/:id" do
  @recipe = Recipe.find(params[:id])
  erb :show_recipe
end

# EDIT
get "/recipes/:id/edit" do
  @recipe = Recipe.find(params[:id])
  erb :edit_recipe_form
end

# UPDATE
put "/recipes/:id" do
  @recipe = Recipe.find(params[:id])
  @recipe.update(title: params[:title],
                 ingredients: params[:ingredients],
                 description: params[:description])
  redirect recipe_path(@recipe)
end

# DELETE
delete "/recipes/:id" do
  recipe = Recipe.find(params[:id])
  recipe.destroy
  redirect "/recipes"
end
