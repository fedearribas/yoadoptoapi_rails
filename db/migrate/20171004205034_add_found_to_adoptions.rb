class AddFoundToAdoptions < ActiveRecord::Migration[5.1]
  def change
    add_column :adoptions, :found, :boolean
  end
end
