class TopsController < ApplicationController
  def index
    @user = current_user

    if logged_in?
      @bookmark = current_user.bookmarks.build
      @bookmarks = current_user.bookmarks.order('created_at DESC')
    end
  end
end
