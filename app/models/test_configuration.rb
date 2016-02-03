class TestConfiguration < ActiveRecord::Base
  belongs_to :test

  enum name_style: [:similar_name_style, :exact_name_style, :given_name_style]
  enum artist_style: [:dropdown_artist_style, :similar_artist_style, :exact_artist_style]
  enum year_style: [:exact_year_style, :decade_year_style, :relative_year_style]
end
