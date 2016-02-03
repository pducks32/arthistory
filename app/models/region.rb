class Region < ActiveRecord::Base
  has_many :cities

  has_many :artwork, as: :locatable

  def description
    name.titleize
  end
end
