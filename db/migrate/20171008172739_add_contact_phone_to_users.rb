class AddContactPhoneToUsers < ActiveRecord::Migration[5.1]
  def change
      add_column :users, :contact_phone, :integer
      add_column :users, :contact_email, :string
  end
end
