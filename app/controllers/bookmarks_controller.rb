class BookmarksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    redirect_to users_path
  end

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to user_path(current_user)
    else
      render 'users/show'
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to user_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url)
  end

  def correct_user
    @bookmark = current_user.bookmarks.find_by(id: params[:id])
    unless @bookmark
      redirect_to current_user
    end
  end
end
