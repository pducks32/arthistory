class City < ActiveRecord::Base
  belongs_to :region
  has_many :places

  has_many :artwork, as: :locatable

  def description
    "#{name.titleize}"
  end
end
