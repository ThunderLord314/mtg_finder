class ArtistsController < ApplicationController
	def show
		@artist = Artist.find(params[:id])
		@cards = Artist.find(params[:id]).cards.page(params[:page]).per(50)
	end
end
