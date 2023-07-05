require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

it 'should validate street' do
    apartment = user.apartments.create(
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
    expect(apartment.errors[:street]).to include("can't be blank")
  end

  it 'should validate unit' do
    apartment = user.apartments.create(
      street: 'Memory Lane',
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
    expect(apartment.errors[:unit]).to include("can't be blank")
  end

  it 'should validate prefecture' do
    apartment = user.apartments.create(
      street: 'Memory Lane',
      unit: '777',
      city: 'Daisen',
      square_footage: 250,
      price: 173.00,
      bedrooms: 1,
      bathrooms: 0.5,
      pets: 'Dogs, Fish, Cats Allowed',
      amenities: 'Air Conditioner, Bath and Toliet, Bidet',
      image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
    )
    expect(apartment.errors[:prefecture]).to include("can't be blank")
  end

 

  it 'should validate city' do
    apartment = user.apartments.create(
      street: 'Memory Lane',
      unit: '777',
      prefecture: 'Akita',
      square_footage: 250,
      price: 173.00,
      bedrooms: 1,
      bathrooms: 0.5,
      pets: 'Dogs, Fish, Cats Allowed',
      amenities: 'Air Conditioner, Bath and Toliet, Bidet',
      image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
    )
    expect(apartment.errors[:city]).to include("can't be blank")

  end

  it 'should validate square_footage' do
    apartment = user.apartments.create(
      street: 'Memory Lane',
      unit: '777',
      prefecture: 'Akita',
      city: 'Daisen',
      price: 173.00,
      bedrooms: 1,
      bathrooms: 0.5,
      pets: 'Dogs, Fish, Cats Allowed',
      amenities: 'Air Conditioner, Bath and Toliet, Bidet',
      image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
    )
    expect(apartment.errors[:square_footage]).to include("can't be blank")
  end

  it 'should validate price' do
    apartment = user.apartments.create(
      street: 'Memory Lane',
      unit: '777',
      prefecture: 'Akita',
      city: 'Daisen',
      square_footage: 250,
      bedrooms: 1,
      bathrooms: 0.5,
      pets: 'Dogs, Fish, Cats Allowed',
      amenities: 'Air Conditioner, Bath and Toliet, Bidet',
      image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
    )
    expect(apartment.errors[:price]).to include("can't be blank")
  end

  it 'should validate bedrooms' do
    apartment = user.apartments.create(
      street: 'Memory Lane',
      unit: '777',
      prefecture: 'Akita',
      city: 'Daisen',
      square_footage: 250,
      price: 173.00,
      bathrooms: 0.5,
      pets: 'Dogs, Fish, Cats Allowed',
      amenities: 'Air Conditioner, Bath and Toliet, Bidet',
      image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
    )
    expect(apartment.errors[:bedrooms]).to include("can't be blank")
  end

  it 'should validate bathrooms' do
    apartment = user.apartments.create(
      street: 'Memory Lane',
      unit: '777',
      prefecture: 'Akita',
      city: 'Daisen',
      square_footage: 250,
      price: 173.00,
      bedrooms: 1,
      pets: 'Dogs, Fish, Cats Allowed',
      amenities: 'Air Conditioner, Bath and Toliet, Bidet',
      image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
    )
    expect(apartment.errors[:bathrooms]).to include("can't be blank")
  end

  it 'should validate pets' do
    apartment = user.apartments.create(
      street: 'Memory Lane',
      unit: '777',
      prefecture: 'Akita',
      city: 'Daisen',
      square_footage: 250,
      price: 173.00,
      bedrooms: 1,
      bathrooms: 0.5,
      amenities: 'Air Conditioner, Bath and Toliet, Bidet',
      image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
    )
    expect(apartment.errors[:pets]).to include("can't be blank")
  end

  it 'should validate amenities' do
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
      image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
    )
    expect(apartment.errors[:amenities]).to include("can't be blank")
  end

  it 'should validate image' do
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
    )
    expect(apartment.errors[:image]).to include("can't be blank")
  end

end









 


