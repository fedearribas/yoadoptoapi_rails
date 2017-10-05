class AddPublicationTypeToMarkedAdoptions < ActiveRecord::Migration[5.1]
  def change
    add_column :marked_adoptions, :publication_type, :string
  end
end
