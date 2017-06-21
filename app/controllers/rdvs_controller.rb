class RdvsController < ApplicationController
  before_action :set_rdv, only: [:show, :edit, :update, :destroy]

  # GET /rdvs
  # GET /rdvs.json
   def index
    @appointments = Appointment.all
    if @appointments.length == 0
      flash[:alert] = "You have no appointments. Create one now to get started."
    end
  end

  # GET /rdvs/1
  # GET /rdvs/1.json
  def show
  end

  # GET /rdvs/new
  def new
    @rdv = Rdv.new
  end

  # GET /rdvs/1/edit
  def edit
  end


  # POST /appointments
  # POST /appointments.json
  def create
    Time.zone = appointment_params[:time_zone]
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rdvs/1
  # PATCH/PUT /rdvs/1.json
  def update
    respond_to do |format|
      if @rdv.update(rdv_params)
        format.html { redirect_to @rdv, notice: 'Rdv was successfully updated.' }
        format.json { render :show, status: :ok, location: @rdv }
      else
        format.html { render :edit }
        format.json { render json: @rdv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rdvs/1
  # DELETE /rdvs/1.json
  def destroy
    @rdv.destroy
    respond_to do |format|
      format.html { redirect_to rdvs_url, notice: 'Rdv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rdv
      @rdv = Rdv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rdv_params
      params.require(:rdv).permit(:name, :phone_number, :time)
    end
end
