module ServicesHelper

  def service_types(chosen_types)
    types = []
    chosen_types.each do |t|
      types << Service::SERVICE_TYPES[t]
    end
    types.join(", ")
  end

  def f_service_types(chosen_types)
    Service::SERVICE_TYPES[chosen_types]
  end

  def service_type_options
    options_for_select(Service::SERVICE_TYPES.map { |k, v| [v, k]})
  end

end
