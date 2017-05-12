class RecipesController < ApplicationController

	def index
		if ( params[ :query ] && params[ :query ] != '' )
			queryArr = params[ :query ].split( ' ' )

			allResults = [];

			# ...
			queryArr.each do | queryTerm |
				results = Recipe.where( 'name LIKE ?',  "%#{queryTerm}%" )
				allResults = allResults.concat( results )
			end

			@recipes = allResults
		else
			@recipes = Recipe.all
		end
	end

end
