class ServicesController < ApplicationController
  before_action :set_service, only: [:show]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:service_name, :service_address, :service_phonenumber, service_type: [],
      pictures_attributes: [:image, :service_id, :id, :_destroy])
    end

end
