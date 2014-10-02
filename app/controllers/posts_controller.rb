class PostsController < ApplicationController
  before_action :find_group
  before_action :authenticate_user!
  #before_action :login_required, :only => [:new, :create, :edit,:update,:destroy]
  before_action :member_required, :only => [:new, :create ]
def new
    @post = @group.posts.new
end


def create
    
    #@post = @group.posts.new(post_params)
  @post = @group.posts.new(post_params)
  @post.author = current_user
    if @post.save
      redirect_to group_path(@group), :notice => 'Add POST DONE'
    else
      render :new
    end
end

def show
    @post = @group.posts.new
  @post = Post.find(params[:id])
end

def edit
  #
  #@post = @group.posts.find(params[:id])
    @post = current_user.posts.find(params[:id])
    #@post = @group.posts.find(params[:id])
end
def update
    @post = current_user.posts.find(params[:id])
    #@post = @group.posts.find(params[:id])

    if @post.update(post_params)
	# puts "post_params" + "#{post_params}"
      redirect_to group_path(@group), :notice => 'POST EDIT is done'
    else
      render :edit
    end
end

def destroy
    @post = current_user.posts.find(params[:id])
    #@post = @group.posts.find(params[:id])

    @post.destroy
    redirect_to group_path(@group), :alert => 'POST DELETE'
end


private

  def post_params
  
    params.require(:post).permit(:content, :explorer, :url, :category, :status, :created_at, :comment, :id)

#    params.require(:post).permit(:content)	
  end
  
  def find_group
      @group = Group.find(params[:group_id])
  end  
  def member_required
    if !current_user.is_member_of?(@group)
      flash[:alert] = "You are not this group member, can't post new"
      redirect_to group_path(@group)
    end
  end  
end
