class AddDateToPetHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :pet_histories, :date, :date
  end
end
