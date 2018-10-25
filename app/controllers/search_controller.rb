class SearchController < ApplicationController

	def index
		@cards = Card.where("name LIKE ?", "%#{params[:name]}%")
	end

	def show
	end
end
