class SpicesController < ApplicationController

	def index
		spices = Spice.all 
		render json: spices
	end

	# def show
	# 	spice= find_spice
	# 	if spice
	# 	render json: spice
	# 	else
	# 	not_found
	# 	end	
	# end

	def create
		spices=Spice.create(spice_param)
		
		render json: spices, status: :created
		
	end

	def update
		spice=find_spice
		if
		spice.update(spice_param)
		render json: spice
		else
	        not_found
		end
	end

	def destroy
		spice=find_spice
		spice.destroy
		render json: {}

	end


			



	private

	def spice_param
		params.permit(:title, :image, :description, :notes, :rating)
	end

	def find_spice
		Spice.find_by(id: params[:id])
	end

	def not_found
		render json: {error: "spice not found"}, status: :not_found
	end

end