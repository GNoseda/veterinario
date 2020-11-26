class Pet < ApplicationRecord
  belongs_to :client
  has_many :pet_histories
  
  def history_count
    #TODO-implement
  end

  def avg_weight
    #TODO-implement
  end

  def avg_height
    #TODO-implement
  end

  def max_weight
    #TODO-implement
  end

  def max_height
    #TODO-implement
  end

end
