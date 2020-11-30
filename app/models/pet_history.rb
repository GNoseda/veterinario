class PetHistory < ApplicationRecord
    belongs_to :pet
    validates :weight, :heigth, :description, :pet_id, :date, presence: true
end
