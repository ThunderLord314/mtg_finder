class ExpansionsController < ApplicationController
	def show
		@expansion = Expansion.find(params[:id])
		@cards = Expansion.find(params[:id]).cards.page(params[:page]).per(50)
	end
end
