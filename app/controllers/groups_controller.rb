class GroupsController < ApplicationController

before_action :login_required, :only => [:new, :create, :edit,:update,:destroy]
def index
  @groups = Group.all
end
def show
  @group = Group.find(params[:id])
  @posts = @group.posts
end
def new
  @group = Group.new
end
def create
    #@group = Group.new(group_params)
	 @group = current_user.groups.new(group_params)
  
    if @group.save 
      current_user.join!(@group)
      redirect_to groups_path, :notice => 'ADD GROUP dONE'
    else
      render :new
    end
end

def edit
#@group = Group.find(params[:id])
@group = current_user.groups.find(params[:id])
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
   #@group = Group.find(params[:id])
    @group = current_user.groups.find(params[:id])
   @group.destroy
   redirect_to groups_path, :alert => 'Delete Group'
end

  def join
    @group = Group.find(params[:id])

    if !current_user.is_member_of?(@group)
      current_user.join!(@group)
      flash[:notice] = "ADD GROUP DONE"
    else
      flash[:warning] = "You are the member of group"
    end

    redirect_to group_path(@group)
  end

  def quit
    @group = Group.find(params[:id])

    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
      flash[:alert] = "logout POST"
    else
      flash[:warning] = "You are not the member XD"
    end

    redirect_to group_path(@group)
  end
private


  def group_params
      params.require(:group).permit(:title, :description)
  end
end
