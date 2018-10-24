class ExpansionsController < ApplicationController
	def show
		@expansion = Expansion.find(params[:id])
	end
end
