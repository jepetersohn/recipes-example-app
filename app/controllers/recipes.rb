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
  erb :"recipes/index"
end

# NEW
get "/recipes/new" do
  login_required!
  @recipe = Recipe.new
  erb :"recipes/new"
end

# CREATE
post "/recipes" do
  login_required!
  @recipe = current_user.recipes.new(params[:recipe])
  if @recipe.save
    redirect recipe_path(@recipe)
  else
    erb :"recipes/new"
  end

end

# SHOW
get "/recipes/:id" do
  @recipe = Recipe.find(params[:id])
  erb :"recipes/show"
end

# EDIT
get "/recipes/:id/edit" do
  login_required!
  @recipe = current_user.recipes.find(params[:id])
  erb :"recipes/edit"
end

# UPDATE
put "/recipes/:id" do
  login_required!
  @recipe = current_user.recipes.find(params[:id])
  @recipe.update(params[:recipe])
  redirect recipe_path(@recipe)
end

# DELETE
delete "/recipes/:id" do
  login_required!
  recipe = current_user.recipes.find(params[:id])
  recipe.destroy
  redirect recipes_path
end
