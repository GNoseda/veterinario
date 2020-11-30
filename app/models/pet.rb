class Pet < ApplicationRecord
  belongs_to :client
  has_many :pet_histories

  validates :name, :race, :birthdate, :client_id, presence: true

  def history_count
    self.pet_histories.count
  end

  def avg_weight
    self.pet_histories.map(&:weight).sum/self.pet_histories.count
  end

  def avg_height
    self.pet_histories.map(&:heigth).sum/self.pet_histories.count
  end

  def max_weight
    self.pet_histories.map(&:weight).max
  end

  def max_height
    self.pet_histories.map(&:heigth).max
  end

end
