
class ArtistGrader

  def initialize(test_configuration: )
    @style = test_configuration.artist_style.to_sym
  end

  def grade(question)
    resolve_grade response_name: question.artist_response.answer,
                  artist_name:  question.artwork.artist.name
  end

  def resolve_grade(response_name:, artist_name:)
    case @style
    when :dropdown_artist_style
      dropdown_compare response_name: response_name, artist_name: artist_name
    when :similar_artist_style
      similar_compare response_name: response_name, artist_name: artist_name
    when :exact_artist_style
      exact_compare response_name: response_name, artist_name: artist_name
    end
  end

  def exact_compare(response_name:, artist_name:)
    [artist_name.common, artist_name.full].map(&:downcase).include? response_name.downcase
  end

  def similar_compare(response_name:, artist_name:)
    
  end

  def dropdown_compare(response_name:, artist_name:)
    response_name.to_i == artist_name.id
  end
end
