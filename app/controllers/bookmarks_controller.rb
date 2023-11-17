class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:new, :create]
  # before_action :set_bookmark

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to lists_path(@list)
    else
      render :new
    end
  end

  # def destroy
  # end

  # private

  # def set_bookmark
  #   @bookmark = Bookmark.find(params[:list_id])
  # end

end

private

def bookmark_params
  params.require(:bookmark).permit(:comment, :movie_id)
end

def set_bookmark
  @list = List.find(params[:list_id])
end
