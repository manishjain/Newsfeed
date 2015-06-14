class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		@post = current_user.posts.build 
  		@comment = current_user.comments.build 
  		# @feed_items = current_user.feed.paginate(page: params[:page], per_page: PER_PAGE)
  		@feed_items = Post.getFeed.paginate(page: params[:page], per_page: PER_PAGE)
  	end
  end

  def help
  end
end
