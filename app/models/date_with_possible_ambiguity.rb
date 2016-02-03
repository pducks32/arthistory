class DateWithPossibleAmbiguity < ActiveRecord::Base
  belongs_to :dateable, polymorphic: true

  def year
    circa = "c." if approximation?
    "#{circa}#{date}"
  end
end
