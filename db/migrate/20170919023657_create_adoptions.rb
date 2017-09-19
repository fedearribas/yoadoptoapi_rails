class CreateAdoptions < ActiveRecord::Migration[5.1]
  def change
    create_table :adoptions do |t|
      t.text :name
      t.integer :age
      t.text :age_measurement_unit
      t.text :image
      t.boolean :adopted
      t.text :description
      t.date :published_date
      t.integer :contact_phone
      t.text :contact_email

      t.timestamps
    end
  end
end
