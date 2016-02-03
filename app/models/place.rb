class Place < ActiveRecord::Base
  belongs_to :city

  has_many :artwork, as: :locatable

  def description
    [name, city&.name].compact.map(&:titleize).join ", "
  end
end
