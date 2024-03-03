class UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = User.where(role: 'Customer')
    @owners = User.where(role: 'Owner')
    @users = User.where.not(role: 'Admin') # Exclude admin users
  end

  

  private

  def authenticate_admin!
    unless current_user && current_user.role == "Admin"
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end


end
