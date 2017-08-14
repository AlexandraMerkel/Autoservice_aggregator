class Service < ApplicationRecord
  has_many :pictures, inverse_of: :service, dependent: :destroy

  SERVICE_TYPES = {
    0 => 'диагностика',
    1 => 'ремонт двигателя',
    2 => 'работы по ходовой части',
    3 => 'работы по электрической части',
    4 => 'регламентное техобслуживание',
    5 => 'кузовные работы',
    6 => 'шиномонтаж',
    7 => 'дополнительные услуги'
  }

 SERVICE_TYPES_FOR_TYPEAHAED = SERVICE_TYPES.map { |k, v| v }

  accepts_nested_attributes_for :pictures, allow_destroy: true

  validates :service_name, presence: true
  validates :service_type, presence: true
  validates :service_address, presence: true, uniqueness: {scope: :service_name}
  validates :service_phonenumber, presence: true, uniqueness: {scope: :service_name}

  def service_type=(val)
    if val.kind_of?(Array)
      self[:service_type]=val.map(&:to_i)
    else
      self[:service_type]=val
    end
  end

  def Service.search_by_name(services, param)
    param = param.to_s
    @services = services
    @services.where("service_name ILIKE ?", '%' + param + '%')
  end

  def Service.search_by_address(services, param)
    param = param.to_s
    @services = services
    @services.where("service_address ILIKE ?", '%' + param + '%')
  end

  def Service.transform_to_number(types)
    keys = []
    SERVICE_TYPES.map{ |k, v| keys << k if v.eql?(types) }
    keys
  end

  def Service.search_by_services(services, param)
    param = param.to_s
    puts param
    @services = services
    types = transform_to_number(param)
    puts types
    @services.where("? = ANY(service_type)", types)
  end

end
