class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]
  before_action :authorize_owner, only: [:new, :create ,:edit, :update, :my_restaurants]
  before_action :authorize_admin, only: :index

  # GET /restaurants or /restaurants.json
  def index
    @restaurants = Restaurant.all
    unless current_user && current_user.role == "Admin"
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
    def show
      @restaurant = Restaurant.find(params[:id])
      @tables = @restaurant.tables
    end
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    @restaurant.destroy!

    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: "Restaurant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def my_restaurants
    @restaurants = current_user.restaurants if current_user.role == "Owner"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:restaurant_name, :address, :email, :contact_number)
    end

    def authorize_owner
      unless current_user && current_user.role == "Owner"
        flash[:alert] = "You are not authorized to access this page."
        redirect_to root_path
      end
    end
end
