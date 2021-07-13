class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.integer :year
      t.string :genre
      t.string :status

      t.timestamps
    end
  end
end
