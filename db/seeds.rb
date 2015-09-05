User.delete_all
Recipe.delete_all

mike = User.create!(email: "mike@dbc.com", password: "password")
sherif = User.create!(email: "sherif@dbc.com", password: "password")

Recipe.create!(
  title: "Blueberry Waffles",
  description: "They're perfect for a weekend breakfast or brunch, these blueberry pancakes are truly cakes in a pan. Be sure to eat them with New Hampshire maple syrup, none of that imported stuff from Canada. MERICA",
  chef_id: mike.id,
  ingredients: <<-INGREDIENTS.gsub(/^\s+/, '')
    2 cups flour
    1 cup milk
    1 tsp baking powder
    2 eggs
    4 tbl sugar
    1 cup blueberries
  INGREDIENTS
)
Recipe.create!(
  title: "Shrimp Scampi",
  description: "This seafood dish is light and satisfying, mostly because it's primarly shimp and butter. Lemons are a key ingredient. Be sure to squeeze them right before serving the dish.",
  chef_id: mike.id,
  ingredients: <<-INGREDIENTS.gsub(/^\s+/, '')
    1 1/2 lbs jump shrimp
    2 tbs butter
    1/4 cup white wine
    1 lemon
    2 tsp parsley
  INGREDIENTS
)
Recipe.create!(
  title: "Spicy Pulled Pork",
  description: "This takes forever to make, but you can watch Netflix for nearly the entire process. And when you're done you can opt to not tell anyone you made enough pulled pork for 8 people and just eat the entire pot yourself. You definitely deserve after waiting so long.",
  chef_id: mike.id,
  ingredients: <<-INGREDIENTS.gsub(/^\s+/, '')
    2 onions
    1 whole pork butt
    1 can of chipotle peppers in adobe sauce
    2 cans of Dr. Pepper
    4 tbs of brown sugar
  INGREDIENTS
)
Recipe.create!(
  title: "Roasted Brussel Sprouts",
  description: "Not kid friendly, but once your old enough to grow hair out your ears, this dish is delicious. Brown them in the oven and share them with your middle aged partner while your children look on with disgust.",
  chef_id: sherif.id,
  ingredients: <<-INGREDIENTS.gsub(/^\s+/, '')
    1 1/2 lbs brussel sprouts
    3 tbs olive oil
    3/4 kosher salt
    1/2 black pepper
  INGREDIENTS
)
Recipe.create!(
  title: "Macaroni with Cheddar Cheese",
  description: "Time to get fancy, this mac & cheese is all dressed up and coming to your house. If you have leftovers, this is great as a pizza topping. Be sure you finish it under the broiler to get those yummy crunchy bits.",
  chef_id: sherif.id,
  ingredients: <<-INGREDIENTS.gsub(/^\s+/, '')
    1 lbs elbow macaroni
    1/2 tsp nutmeg
    1 1/2 cups milk
    3 cups shredded white cheddar cheese
    salt
    1/4 tsp cayene pepper
  INGREDIENTS
)
