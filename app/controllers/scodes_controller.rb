class ScodesController < ApplicationController
  def index
    @scodes = Scode.all
  end
  def new
    @scode = Scode.new
  end
  def create
    @scode = Scode.new(scode_params)
    @scode.save
    redirect_to :action => :index
  end
  def show
    @scode = Scode.find(params[:id])
  end
  def edit
    @scode = Scode.find(params[:id])
  end
  def update
    @scode = Scode.find(params[:id])
    @scode.update_attributes(scode_params)
    redirect_to :action => :show, :id => @scode
  end
  def destroy
    @scode = Scode.find(params[:id])
    @scode.destroy
    redirect_to :action => :index
  end
end
private
  def scode_params
    params.require(:scode).permit(:comment, :description, :content, :require)
  end
