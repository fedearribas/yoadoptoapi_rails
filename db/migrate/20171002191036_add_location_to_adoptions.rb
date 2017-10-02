class AddLocationToAdoptions < ActiveRecord::Migration[5.1]
  def change
    add_column :adoptions, :location, :string
  end
end
