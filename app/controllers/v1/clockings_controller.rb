class V1::ClockingsController < ApplicationController
  before_action :set_clocking, only: [:show, :update, :destroy]

  # GET /clockings
  def index
    @clockings = Clocking.all

    render json: @clockings
  end

  # GET /clockings/1
  def show
    render json: @clocking
  end

  # POST /clockings
  def create
    @clocking = Clocking.new(clocking_params)

    if @clocking.save
      render json: @clocking, status: :created
    else
      render json: @clocking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clockings/1
  def update
    if @clocking.update(clocking_params)
      render json: @clocking
    else
      render json: @clocking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clockings/1
  def destroy
    @clocking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clocking
      @clocking = Clocking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clocking_params
      params.permit(:topic, :details, :duration)
    end
end
