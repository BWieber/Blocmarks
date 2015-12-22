class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user =  User.find_by(email: params[:sender])
    @topic = Topic.find_by(user_id: @user, title: params[:subject])

    @url = params["body-plain"]

    if @user.nil?
      @user = User.create(email: params[:sender], password: 'blocmarks2015')
    end

    if @topic.nil?
      @topic = Topic.create(title: params[:title], user_id: @user)
    end

    @bookmark = @user.bookmarks.create(url: @url, topic_id: @topic.id)


    head 200
  end
end
