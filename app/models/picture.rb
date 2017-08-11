class Picture < ApplicationRecord
  belongs_to :service, inverse_of: :pictures

  has_attached_file :image, styles: { large: "800x800>", medium: "500x500>", thumb: "300x300>" }, default_url: "/images/:style/missing.png"

  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }

end
