
class YearGrader

  def initialize(test_configuration: )
    @style = test_configuration.year_style.to_sym
  end

  def grade(question)
    resolve_grade response_year: question.year_response.answer,
                  artwork_year:  question.artwork.creation_date.date
  end

  def resolve_grade(response_year:, artwork_year:)
    case @style
    when :exact_year_style
      exact_compare response_year: response_year, artwork_year: artwork_year
    when :decade_year_style
      decade_compare response_year: response_year, artwork_year: artwork_year
    when :relative_year_style
      relative_compare response_year: response_year, artwork_year: artwork_year
    end
  end

  def exact_compare(response_year:, artwork_year:)
    (response_year.to_i) == (artwork_year.to_i)
  end

  def decade_compare(response_year:, artwork_year:)
    (response_year.to_i / 10) == (artwork_year.to_i / 10)
  end

  def relative_compare(response_year:, artwork_year:)
    relation, response_century = response_year.split " "
    response_century = response_century.to_i / 100
    correct_century, year = artwork_year.divmod(100)
    is_century_correct = correct_century == response_century.to_i
    year_range = case relation.downcase
                  when "early"   then 00..35
                  when "middle"  then 33..66
                  when "late"    then 65..99
                 end
    is_century_correct && year_range.cover?(year)
  end
end
