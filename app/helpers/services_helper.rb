module ServicesHelper

  def show_image(attachment)
    "#{attachment.image_file_name} (#{number_to_human_size(attachment.image_file_size)})"
  end

  def link_to_image(attachment)
    link_to(attachment.image.url, data: {toggle: 'popover', content: "#{image_tag(attachment.image.url(:medium))}", html: true, trigger: 'hover'}) do
      concat content_tag(:span, nil, class: 'glyphicon glyphicon-paperclip')
      concat show_image(attachment)
    end
  end

  def service_types(chosen_types)
    types = []
    chosen_types.each do |t|
      types << Service::SERVICE_TYPES[t]
    end
    types.join(", ")
  end

  def service_type_options
    options_for_select(Service::SERVICE_TYPES.map { |k, v| [v, k]})
  end

end
