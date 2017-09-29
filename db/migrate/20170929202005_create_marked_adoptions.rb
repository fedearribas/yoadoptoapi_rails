class CreateMarkedAdoptions < ActiveRecord::Migration[5.1]
  def change
    create_table :marked_adoptions do |t|
      t.integer :adoption_id
      t.integer :user_id

      t.timestamps
    end
  end
end
