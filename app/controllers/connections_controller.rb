class ConnectionsController < ApplicationController
  before_action :set_connection, only: [:show]

  # # GET /stations
  # # GET /stations.json
  # def index
  #   @stations = Station.all
  # end

  # # GET /stations/1
  # # GET /stations/1.json
  def index
    if params[:connection].present?
      redirect_to connection_path(params[:connection])
      return
    end
    @connections = Connection.all
  end

  def show
    @courses = Course.where(connection: @connection).paginate(page: params[:page], :per_page => 20)
    @cheapest_price = Course.where(connection: @connection).minimum(:price)
  end

  # # GET /stations/new
  # def new
  #   @station = Station.new
  # end

  # # GET /stations/1/edit
  # def edit
  # end

  # # POST /stations
  # # POST /stations.json
  # def create
  #   @station = Station.new(station_params)

  #   respond_to do |format|
  #     if @station.save
  #       format.html { redirect_to @station, notice: 'Station was successfully created.' }
  #       format.json { render :show, status: :created, location: @station }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @station.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /stations/1
  # # PATCH/PUT /stations/1.json
  # def update
  #   respond_to do |format|
  #     if @station.update(station_params)
  #       format.html { redirect_to @station, notice: 'Station was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @station }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @station.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /stations/1
  # # DELETE /stations/1.json
  # def destroy
  #   @station.destroy
  #   respond_to do |format|
  #     format.html { redirect_to stations_url, notice: 'Station was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connection
      @connection = Connection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def station_params
    #   params.require(:station).permit(:name, :connection_id)
    # end
end
