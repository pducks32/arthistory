module ApplicationHelper

  def formatted_answer(response, correct)
    if response.correct?
      response.answer
    else
      "#{response.answer} ➞ #{correct}"
    end
  end

  def formatted_year(response)
    formatted_answer(response, response.question.artwork.creation_date.year)
  end

  def formatted_location(response)
    formatted_answer(response, response.question.artwork.location.name)
  end

  def formatted_artist(response)
    if response.question.test.test_configuration.dropdown_artist_style?
      if response.correct?
        response.question.artwork.artist.common_name.titleize
      else
        "#{Artist.find(response.answer.to_i).common_name.titleize} ➞ #{response.question.artwork.artist.common_name.titleize}"
      end
    else
      if response.correct?
        response.answer
      else
        "#{response.answer} ➞ #{correct}"
      end
    end
  end

  def formatted_name(response)
    formatted_answer(response, response.question.artwork.name.titleize)
  end
end
