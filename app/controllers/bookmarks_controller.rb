class BookmarksController < ApplicationController
  def new
    # find the list from lists for which you want to add a bookmark
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # build book mark with comment
    @bookmark = Bookmark.new(bookmark_params)
    # find the list from lists
    @list = List.find(params[:list_id])
    # associate bookmark with list
    @bookmark.list = @list
    # save bookmark
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # find bookmark by id
    @bookmark = Bookmark.find(params[:id])
    # delete book mark
    @bookmark.destroy
    # redirect to list show page
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
