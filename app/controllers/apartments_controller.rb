class ApartmentsController < ApplicationController


    def index
        apartments = Apartment.all
        render json: apartments
    end

    def create
      
      apartment = Apartment.create(apartment_params)

  
      if apartment.valid?
        render json: apartment, status: :created
      else
        render json: apartment.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def apartment_params
      params.require(:apartment).permit(:street, :unit, :prefecture, :city, :square_footage, :price, :bedrooms, :bathrooms, :pets, :amenities, :image, :user_id)
    end
  end
  