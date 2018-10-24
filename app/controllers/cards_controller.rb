class CardsController < ApplicationController
	def index
		@cards = Card.page(params[:page]).per(100)
	end

	def show
		@card = Card.find(params[:id])
	end
end
