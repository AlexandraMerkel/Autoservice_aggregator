class ServicesController < ApplicationController
  before_action :set_service, only: [:show]

  # GET /services
  # GET /services.json
  def index
    #@services = Service.all
    respond_to do |format|
      format.html do
        @services = Service.all
        @services = @services.search_by_name(@services, params['service_name']) if params['service_name'].present?
        @services = @services.search_by_address(@services, params['service_address']) if params['service_address'].present?
        #@services = @services.search_by_services(@services, params['service_types']) if params['service_types'].present?
      end
      format.json do
        @services = Service.order("service_name").all
        render json: (@services.map do |s|
          {name: s.service_name }
        end)
      end
    end
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
