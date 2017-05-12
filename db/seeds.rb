# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

recipes = [
	'A Really Nice Pie',
	'A Cool Cake',
	'The Best Cobbler',
	'Pasta a la Stuff',
	'Grandma\'s Secret Sauce'
]

ingredients = [
	'Apple',
	'Orange',
	'Banana',
	'Tomato',
	'Peach',
	'Cucumber',
	'Pear'
]

# Loop over `ingredients` array; create 1x new `Ingredient` record for each item.
ingredients.each do | ingredient_name |
	ingredient = Ingredient.new( :name => ingredient_name )
	ingredient.save
end

# Loop over `recipes` array; create 1x new `Recipe` record for each item.
recipes.each do | recipe_name |
	# Create new `Recipe` instance.
	recipe = Recipe.new( :name => recipe_name )

	# Save it.
	recipe.save

	# Create 3-to-8 new `RecipeIngredient` records for the current `Recipe`.
	(3..8).to_a.sample.times do
		recipe_ingredient = RecipeIngredient.new( :recipe_id => recipe.id )
		recipe_ingredient.ingredient_id = Ingredient.all.sample.id

		recipe_ingredient.save
	end
end
