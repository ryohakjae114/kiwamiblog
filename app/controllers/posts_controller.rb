class PostsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @posts = Post.order(created_at: :desc).includes(:user).page(params[:page]).per(10)
  end
end
