require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password') }

  describe "GET /apartments" do
    it 'gets a list of apartments' do
      user.apartments.create(
        street: 'Memory Lane',
        unit: '777',
        prefecture: 'Akita',
        city: 'Daisen',
        square_footage: 250,
        price: 173.00,
        bedrooms: 1,
        bathrooms: 0.5,
        pets: 'Dogs, Fish, Cats Allowed',
        amenities: 'Air Conditioner, Bath and Toilet, Bidet',
        image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
      )

      get '/apartments'

      apartment_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment_response.length).to eq(1)
      expect(apartment_response.first['street']).to eq('Memory Lane')
      expect(apartment_response.first['unit']).to eq('777')
      expect(apartment_response.first['prefecture']).to eq('Akita')
      expect(apartment_response.first['city']).to eq('Daisen')
      expect(apartment_response.first['square_footage']).to eq(250)
      expect(apartment_response.first['price']).to eq(173.0)
      expect(apartment_response.first['bedrooms']).to eq(1)
      expect(apartment_response.first['bathrooms']).to eq(0.5)
      expect(apartment_response.first['pets']).to eq('Dogs, Fish, Cats Allowed')
      expect(apartment_response.first['amenities']).to eq('Air Conditioner, Bath and Toilet, Bidet')
      expect(apartment_response.first['image']).to eq('https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089')
    end
  end

  describe "POST /apartments" do
    it 'creates an apartment' do
      apartment_params = {
        apartment: {
          street: 'James St',
          unit: '68',
          prefecture: 'Akita',
          city: 'Daisen',
          square_footage: 350,
          price: 200.00,
          bedrooms: 2,
          bathrooms: 1.0,
          pets: 'Dogs, Fish, Cats Allowed',
          amenities: 'Air Conditioner, Bath and Toilet, Bidet',
          image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(201)

      apartment = Apartment.first

      expect(apartment.street).to eq('James St')
    end
  end

  describe "PATCH /apartments/:id" do
    it 'updates an apartment using PATCH request' do
      apartment = user.apartments.create(
        street: 'Memory Lane',
        unit: '777',
        prefecture: 'Akita',
        city: 'Daisen',
        square_footage: 250,
        price: 173.00,
        bedrooms: 1,
        bathrooms: 0.5,
        pets: 'Dogs, Fish, Cats Allowed',
        amenities: 'Air Conditioner, Bath and Toilet, Bidet',
        image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
      )

      updated_attributes = {
        apartment: {
          street: 'Updated St',
          unit: '999',
          prefecture: 'Akita',
          city: 'Daisen',
          square_footage: 250,
          price: 173.00,
          bedrooms: 1,
          bathrooms: 0.5,
          pets: 'Dogs, Fish, Cats Allowed',
          amenities: 'Air Conditioner, Bath and Toilet, Bidet',
          image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
        }
      }

      patch "/apartments/#{apartment.id}", params: updated_attributes

      expect(response).to have_http_status(200)

      apartment.reload
      expect(apartment.street).to eq('Updated St')
      expect(apartment.unit).to eq('999')
    end
  end
end
