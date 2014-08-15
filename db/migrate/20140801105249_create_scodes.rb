class CreateScodes < ActiveRecord::Migration
  def change
    create_table :scodes do |t|
      t.integer :index
      t.text :content
      t.text :description
      t.text :comment
      t.text :require

      t.timestamps
    end
  end
end
