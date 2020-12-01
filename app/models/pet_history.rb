class PetHistory < ApplicationRecord
    belongs_to :pet
    validates :weight, :heigth, :pet_id, :date, presence: true
    validates :weight, :heigth, numericality: true

    def get_date
        self.date.strftime("%d/%m/%Y")
    end
end
