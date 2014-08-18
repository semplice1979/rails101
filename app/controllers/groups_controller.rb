class GroupsController < ApplicationController

before_action :login_required, :only => [:new, :create, :edit,:update,:destroy]
def index
  @groups = Group.all
end
def show
  @group = Group.find(params[:id])
  #@posts = @group.posts
end
def new
  @group = Group.new
end
def create
    @group = Group.new(group_params)
  
    if @group.save 
      redirect_to groups_path, :notice => 'Add Group is done'
    else
      render :new
    end
end

def edit
@group = Group.find(params[:id])
#@post = @group.posts.find(params[:id])
end

def update

    @group = Group.find(params[:id])
  
    if @group.update(group_params)
      redirect_to groups_path, :notice => 'Edit Group is done'
    else
      render :edit
    end
end


def destroy
   @group = Group.find(params[:id])
    
   @group.destroy
   redirect_to groups_path, :alert => 'Delete Group'
end


private


  def group_params
      params.require(:group).permit(:title, :description)
  end
end
