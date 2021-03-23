class AddAuthorToNotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :author, foreign_key: { to_table: :users }
  end
end
