class AddStatusToEvents < ActiveRecord::Migration
  def change
	add_column :events, :status, :string
	add_column :events, :index, :integer
  end
end
