helpers do
  def recipe_path(recipe)
    "/recipes/#{recipe.id}"
  end

  def recipes_path
    "/recipes"
  end

  def new_recipe_path
    "/recipes/new"
  end

  def edit_recipe_path(recipe)
    "/recipes/#{recipe.id}/edit"
  end
end