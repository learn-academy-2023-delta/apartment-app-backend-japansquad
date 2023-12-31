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

    def update
        apartment = Apartment.find(params[:id])
        apartment.update(apartment_params)
        if apartment.valid?
            render json: apartment
        else
            render json: apartment.errors, status: 422
        end
    end

    def destroy
      apartment = Apartment.find(params[:id])
      apartment.destroy
      render json:apartment
    end
  
    private
  
    def apartment_params
      params.require(:apartment).permit(:street, :unit, :prefecture, :city, :square_footage, :price, :bedrooms, :bathrooms, :pets, :amenities, :image, :user_id)
    end
  end
  