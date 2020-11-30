class Client < ApplicationRecord
    has_many :pets
    validates :name, :phone, :email, presence: true

    def pets_count
        self.pets.count
    end
end
