class Picture < ApplicationRecord
  belongs_to :service, inverse_of: :pictures

  has_attached_file :image, styles: { large: "700x700>", medium: "400x400>", thumb: "200x200>" }, default_url: "/images/:style/missing.png"

  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }

end
