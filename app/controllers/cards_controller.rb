class CardsController < ApplicationController
	def index
		@cards = Card.all.sample(10)
	end

	def show
		@card = Card.find(params[:id])
	end
end
