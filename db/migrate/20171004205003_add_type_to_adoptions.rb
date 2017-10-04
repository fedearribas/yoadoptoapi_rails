class AddTypeToAdoptions < ActiveRecord::Migration[5.1]
  def change
    add_column :adoptions, :type, :string
  end
end
