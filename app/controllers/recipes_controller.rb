class RecipesController < ApplicationController

	def index
		if ( params[ :query ] && params[ :query ] != "" )
			# Split query into array of terms.
			# eg. "My Apple Pie" becomes  [ "My", "Apple", "Pie" ]
			queryArr = params[ :query ].split( " " )

			# Create new empty array.
			allResults = [];

			# Loop over each item in the new `queryArr` array.
			queryArr.each do | queryTerm |
				# Query the database for any recipes where:
				# - the `queryTerm` is *LIKE* the recipe name
				# - *OR* the `queryTerm` is *LIKE* one of the ingredient names.
				results = Recipe.joins( :ingredients ).where( "recipes.name LIKE ? OR ingredients.name LIKE ?",  "%#{queryTerm}%", "%#{queryTerm}%" )

				# Update the `allResults` array with the old and new values.
				allResults = allResults.concat( results )
			end

			# Remove duplicate values from `allResults` and assign to the `@recipes` instance variable.
			@recipes = allResults.uniq
		else
			@recipes = Recipe.all
		end
	end

end
