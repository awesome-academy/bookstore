class ActivitiesController < ApplicationController
  def index
    @blogs_notification = Blog.blogs_were_liked(current_user.id)
  end
end
