helpers do
  # Root route
  def root_path
    "/"
  end

  # Recipe routes
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

  # User routes
  def new_user_path
    "/users/new"
  end

  # Login routes
  def login_path
    "/login"
  end

  def logout_path
    "/logout"
  end
end