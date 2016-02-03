class Question < ActiveRecord::Base
  belongs_to :test
  has_one :artwork

  has_one :year_response, -> () { where response_type: 2 }, class_name: "Response"
  has_one :artist_response, -> () { where response_type: 1 }, class_name: "Response"
  has_one :name_response, -> () { where response_type: 0 }, class_name: "Response"
  has_one :location_response, -> () { where response_type: 0 }, class_name: "Response"

  def score
    config = self.test.test_configuration
    year_response.correct = YearGrader.new(test_configuration: config).grade(self)
    artist_response.correct = ArtistGrader.new(test_configuration: config).grade(self)
    name_response.correct = NameGrader.new(test_configuration: config).grade(self)
    location_response.correct = (self.artwork.location.name.downcase == self.location_response.answer.downcase)
  end

  def year_response=(a_response)
    a_response.year_type!
    super
  end
  def artist_response=(a_response)
    a_response.artist_type!
    super
  end
  def name_response=(a_response)
    a_response.name_type!
    super
  end
  def location_response=(a_response)
    a_response.location_type!
    super
  end
end
