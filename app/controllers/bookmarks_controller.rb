class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.create
    @bookmark.list = List.find(params[:list_id])
  end

  def create
    bookmark_data = bookmark_params
    @bookmark = Bookmark.create(bookmark_data)
    @bookmark.movie = Movie.find(bookmark_data[:movie_id])
    list = List.find(params[:list_id])
    @bookmark.list = list
    if @bookmark.save
      redirect_to list
    else
      render :new
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    redirect_to List.find(params[:list_id])
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
