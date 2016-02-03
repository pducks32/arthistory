class Response < ActiveRecord::Base
  belongs_to :question

  enum response_type: [:name_type, :artist_type, :year_type, :location_type]
end
