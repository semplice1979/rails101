class Account::PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = current_user.posts.order("id DESC")
  end

  def show 
  	@posts = current_user.posts
  end
  def closed
  	@posts = current_user.posts
  end
  def complete
    #Post.update_all(["completed_at=?", Time.now], :status => params[:post_stas])
  end



end

