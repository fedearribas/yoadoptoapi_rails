class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :adoptions, :type, :publication_type
  end
end
