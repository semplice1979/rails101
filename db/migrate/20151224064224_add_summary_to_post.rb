class AddSummaryToPost < ActiveRecord::Migration
  def change

      add_column :posts, :summary, :string
      add_column :posts, :reporter, :string  
      add_column :posts, :priority, :integer  
      #add_column :posts, :attach_link, :string

  end
end
