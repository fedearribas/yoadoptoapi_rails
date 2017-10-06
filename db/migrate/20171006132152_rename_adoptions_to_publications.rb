class RenameAdoptionsToPublications < ActiveRecord::Migration[5.1]
  def change
    rename_table :adoptions, :publications
  end
end
