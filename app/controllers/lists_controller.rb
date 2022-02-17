class ListsController < ApplicationController
  def index
  end

  def new
    @list = List.create
  end

  def show
  end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
