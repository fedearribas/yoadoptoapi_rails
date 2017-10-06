class RenameMarkedAdoptionsToMarkedPublications < ActiveRecord::Migration[5.1]
  def change
    rename_table :marked_adoptions, :marked_publications
  end
end
