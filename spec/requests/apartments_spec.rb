RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  describe "GET /apartments" do
    it 'gets a list of apartments' do
      apartment = user.apartments.create(
        {
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
        }
      )

      get '/apartments'

      apartments = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(Apartments.length).to eq 1
      expect(apartments.first['street']).to eq('Memory Lane')
      expect(apartments.first['unit']).to eq('777')
      expect(apartments.first['prefecture']).to eq('Akita')
      expect(apartments.first['city']).to eq('Daisen')
      expect(apartments.first['square_footage']).to eq(250)
      expect(apartments.first['price']).to eq(173.00)
      expect(apartments.first['bedrooms']).to eq(1)
      expect(apartments.first['bathrooms']).to eq(0.5)
      expect(apartments.first['pets']).to eq('Dogs, Fish, Cats Allowed')
      expect(apartments.first['amenities']).to eq('Air Conditioner, Bath and Toilet, Bidet')
      expect(apartments.first['image']).to eq('https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089')
    end
  end
end
