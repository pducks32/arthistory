class Artist < ActiveRecord::Base
  def self.has_a_dateable_named(name, type: name.to_s.classify, **options)
    has_one name, -> { where dateable_field_name: type },
      as: :dateable,
      class_name: DateWithPossibleAmbiguity
    accepts_nested_attributes_for name
  end

  has_one :student, inverse_of: :teacher, class_name: "Artist", foreign_key: "teacher_id"
  belongs_to :teacher, inverse_of: :student, class_name: "Artist", foreign_key: "teacher_id"

  has_one :name
  has_many :artwork
  has_a_dateable_named :birth_date
  has_a_dateable_named :death_date

  accepts_nested_attributes_for :name


  def birth_date=(a_birth_date)
    a_birth_date.dateable_field_name = "BirthDate"
    super
  end

  def death_date=(a_death_date)
    a_death_date.dateable_field_name = "DeathDate"
    super
  end

  %i(first middle last full common).each do |a|
    define_method("#{a}_name") do
      self.name.send(a)
    end
  end

end
