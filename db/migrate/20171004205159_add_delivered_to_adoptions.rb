class AddDeliveredToAdoptions < ActiveRecord::Migration[5.1]
  def change
    add_column :adoptions, :delivered, :boolean
  end
end
