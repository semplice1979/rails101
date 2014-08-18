class PostsController < ApplicationController
  before_action :find_group
  before_action :login_required, :only => [:new, :create, :edit,:update,:destroy]
def new
    
    @post = @group.posts.new
end
def create
    
    @post = @group.posts.new(post_params)
  
    if @post.save
      redirect_to group_path(@group), :notice => 'Add POST DONE'
    else
      render :new
    end
end
def edit
  #
  #@post = @group.posts.find(params[:id])
    
    @post = @group.posts.find(params[:id])
end
def update
    
    @post = @group.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to group_path(@group), :notice => 'POST EDIT is done'
    else
      render :edit
    end
end

def destroy
    
    @post = @group.posts.find(params[:id])

    @post.destroy
    redirect_to group_path(@group), :alert => 'POST DELETE'
end


private

  def post_params
    params.require(:post).permit(:content)
  end
  def find_group
      @group = Group.find(params[:group_id])
  end  
  
end
