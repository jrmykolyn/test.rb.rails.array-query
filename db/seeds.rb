# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

name_bits = [
	'The',
	'Cool',
	'Apple',
	'Banana',
	'Orange',
	'Beet'
]

20.times do |i|
	# ...
	recipe = Recipe.new

	# ...
	name = ''
	5.times { |i| name += name_bits.sample }
	recipe.name = name;

	# ...
	recipe.save
end
