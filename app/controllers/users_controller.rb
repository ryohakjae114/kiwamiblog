class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
