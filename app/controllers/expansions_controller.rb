class ExpansionsController < ApplicationController
	def show
		@expansion = Expansion.find(params[:id]).page(params[:page]).per(40)
	end
end
