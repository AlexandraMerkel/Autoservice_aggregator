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
  validates :service_type, presence: true #,  inclusion: { in: SERVICE_TYPES.keys }
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
    #params = params.to_s.gsub(/\s+/, '')
    @services = services
    @services.where("service_name ILIKE ?", '%' + param + '%')
  end

  def Service.search_by_address(services, param)
    param = param.to_s
    @services = services
    @services.where("service_address ILIKE ?", '%' + param + '%')
  end

  def types_transform(types)
    keys = []
    SERVICE_TYPES.map{ |k, v| keys << k if v.eql?(types) }
  end

  def Service.search_by_service(services, param)
    param = param.to_s
    @services = services
    types = types_transform(param)
    @services.where("service_type = ?", types)
  end

end
