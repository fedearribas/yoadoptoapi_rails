class RenameForeignKeys < ActiveRecord::Migration[5.1]
  def change
      rename_column :comments, :adoption_id, :publication_id
      rename_column :marked_publications, :adoption_id, :publication_id
  end
end
