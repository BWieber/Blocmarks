class LikesController < ApplicationController

  after_action :verify_authorized

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = @bookmark.topic
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = "Bookmark Liked!"
      redirect_to :back
    else
      flash[:alert] = "There was an error liking this bookmark. Please try again."
      redirect_to :back
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = @bookmark.topic
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Bookmark unliked."
      redirect_to :back
    else
      flash[:alert] = "There was an error unliking this bookmark. Please try again."
      redirect_to :back
    end
  end
end
