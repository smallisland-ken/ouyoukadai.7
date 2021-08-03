class RemoveBookIdFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :book_id, :integer
  end
end
