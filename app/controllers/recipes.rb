get "/all_recipes" do
  puts params.inpect
  @recipes = Recipe.all
  erb :all_recipes
end

get "/show_recipe" do
  puts params.inpect
  @recipe = Recipe.find(params[:id])
  erb :show_recipe
end

get "/new_recipe_form" do
  puts params.inpect
  @recipe = Recipe.new
  erb :new_recipe_form
end

post "/create_recipe" do
  puts params.inpect
  @recipe = Recipe.create(title: params[:title],
                          ingredients: params[:ingredients],
                          directions: params[:directions])
  redirect "/show_recipe?id=#{@recipe.id}"
end

get "/edit_recipe_form" do
  puts params.inpect
  @recipe = Recipe.find(params[:id])
  erb :edit_recipe_form
end

post "/update_recipe" do
  puts params.inpect
  @recipe = Recipe.find(params[:id])
  @recipe.update(title: params[:title],
                 ingredients: params[:ingredients],
                 directions: params[:directions])
  redirect "/show_recipe?id=#{@recipe.id}"
end

get "/delete_recipe" do
  puts params.inpect
  recipe = Recipe.find(params[:id])
  recipe.destroy
  redirect "/all_recipes"
end

