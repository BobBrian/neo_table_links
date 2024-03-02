class UserListController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  
  def index
    @customers = User.where(role: 'Customer')
    @owners = User.where(role: 'Owner')
  end

  private

  def authorize_admin
    unless current_user && current_user.role == "Admin"
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end
  end
  
end