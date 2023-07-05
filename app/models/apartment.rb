class Apartment < ApplicationRecord
    belongs_to :user
    validates :street, :unit, :prefecture, :city, :square_footage, :price, :bedrooms, :bathrooms, :pets, :amenities, :image, :user_id, presence: true
end
