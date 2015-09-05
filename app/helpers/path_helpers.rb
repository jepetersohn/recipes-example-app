helpers do
  def root_path
    "/"
  end

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

  def new_user_path
    "/users/new"
  end
end