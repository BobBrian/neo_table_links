class TablesController < ApplicationController
  before_action :set_table, only: %i[ show edit update destroy ]
  before_action :set_restaurant, only: [:new, :create]

  # GET /tables or /tables.json
  def index
    @tables = Table.all
  end

  # GET /tables/1 or /tables/1.json
  def show
  end

  # GET /tables/new
  def new
    @table = @restaurant.tables.build
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables or /tables.json
  def create
    @table = @restaurant.tables.build(table_params)
  
    respond_to do |format|
      if @table.save
        format.html { redirect_to restaurant_url(@restaurant), notice: "Table was successfully created." }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1 or /tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to @table, notice: "Table was successfully updated." }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1 or /tables/1.json
  def destroy
    #This line retrieves a specific record from the tables table in the database based on the id parameter 
    #passed in the request. It's commonly used in Rails to fetch a single record by its unique identifier.
    @table = Table.find(params[:id]) 

    #This line retrieves the associated restaurant record for the @table instance. 
    #Assuming there's an association between tables and restaurants tables, this line uses 
    #that association to fetch the related restaurant.
    @restaurant = @table.restaurant

    #This line deletes the @table record from the database. 
    #In Rails, the destroy method not only removes the record from the table but also runs any 
    #associated callbacks and removes associated records if there are any dependent relationships configured.
    @table.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_url(@restaurant), notice: "Table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def table_params
      params.require(:table).permit(:table_name, :seat_number, :is_available)
    end

    # Define a Restaurant associated with a table
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
