class ShippersController < ApplicationController
  before_action :set_shipper, only: %i[ show edit update destroy ]

  # GET /shippers or /shippers.json
  def index
    @shippers = restricted_index(Shipper)
  end

  # GET /shippers/1 or /shippers/1.json
  def show
  end

  # GET /shippers/new
  def new
    @shipper = Shipper.new
  end

  # GET /shippers/1/edit
  def edit
  end

  # POST /shippers or /shippers.json
  def create
    @shipper = Shipper.new(shipper_params)

    respond_to do |format|
      if @shipper.save
        format.html { redirect_to shipper_url(@shipper), notice: "Shipper was successfully created." }
        format.json { render :show, status: :created, location: @shipper }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shipper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shippers/1 or /shippers/1.json
  def update
    respond_to do |format|
      if @shipper.update(shipper_params)
        format.html { redirect_to shipper_url(@shipper), notice: "Shipper was successfully updated." }
        format.json { render :show, status: :ok, location: @shipper }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shipper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shippers/1 or /shippers/1.json
  def destroy
    @shipper.destroy

    respond_to do |format|
      format.html { redirect_to shippers_url, notice: "Shipper was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipper
      @shipper = Shipper.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipper_params
      params.require(:shipper).permit(:shipper_name, :phone)
    end
end
