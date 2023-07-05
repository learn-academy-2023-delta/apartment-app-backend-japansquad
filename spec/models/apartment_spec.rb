require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  describe "GET /index" do
    it 'gets a list of apartments' do
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
        amenities: 'Air Conditioner, Bath and Toliet, Bidet',
        image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
      )
      get '/apartments'

      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.first['street']).to eq('Memory Lane')
      expect(apartment.first['unit']).to eq('777')
      expect(apartment.first['prefecture']).to eq('Akita')
      expect(apartment.first['city']).to eq('Daisen')
      expect(apartment.first['square_footage']).to eq(250)
      expect(apartment.first['price']).to eq(173.00)
      expect(apartment.first['bedrooms']).to eq(1)
      expect(apartment.first['bathrooms']).to eq(0.5)
      expect(apartment.first['pets']).to eq('Dogs, Fish, Cats Allowed')
      expect(apartment.first['amenities']).to eq('Air Conditioner, Bath and Toliet, Bidet')
      expect(apartment.first['image']).to eq('https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089')

    end
  end
end