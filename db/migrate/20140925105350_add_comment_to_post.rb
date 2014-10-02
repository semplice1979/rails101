class AddCommentToPost < ActiveRecord::Migration
  def change
  
      add_column :posts, :explorer, :string
      add_column :posts, :url, :string  
      add_column :posts, :category, :string  
      add_column :posts, :attach_link, :string
      add_column :posts, :status, :string	  
      add_column :posts, :comment, :string	  
      add_column :posts, :verify_date, :string
      add_column :posts, :check_result, :string	  	  
	  
  end
end
