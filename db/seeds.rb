user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_apartments = [
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
        amenities: 'Air Conditioner, Bath and Toliet, Bidet',
        image: 'https://www.leopalace21.com/app/image/request?TABLE=LEO_IMAGE&IMAGE=IM_IMAGE&IM_BK_NO=17089'
    }
]

user2_apartments = [
    {
        street: 'Shibuya Lane',
        unit: '11-D',
        prefecture: 'Tokyo',
        city: 'Shibuya City',
        square_footage: 1829.86,
        price: 6223.55,
        bedrooms: 3,
        bathrooms: 2.5,
        pets: 'Negotiable',
        amenities: 'Air Conditioner, Bath and Toliet, Bidet, Wood Flooring, Washing Machine, Dryer, Washer, Gas Stove, Refrigerator, Dish Washer, Garbage Disposal',
        image: 'https://img.plazahomes.co.jp/rental/-/1280/1280/2248_20.jpg'
    }
]

user1_apartments.each do |apartment|
    user1.apartments.create(apartment)
    p "created: #{apartment}"
  end
  
  user2_apartments.each do |apartment|
    user2.apartments.create(apartment)
    p "created: #{apartment}"
  end