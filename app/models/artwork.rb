class Artwork < ActiveRecord::Base
  def self.has_a_dateable_named(name, type: name.to_s.classify, **options)
    has_one name, -> { where dateable_field_name: type },
      as: :dateable,
      class_name: DateWithPossibleAmbiguity
    accepts_nested_attributes_for name
  end

  has_a_dateable_named :creation_date
  belongs_to :artist
  belongs_to :locatable, polymorphic: true

  def creation_date=(a_date)
    a_date.dateable_field_name = "CreationDate"
    super
  end

  def location
    self.locatable
  end

  def location=(location)
    self.locatable = location
  end
end
