class NameGrader

  def initialize(test_configuration: )
    @style = test_configuration.name_style.to_sym
  end

  def grade(question)
    resolve_grade response_name: question.name_response.answer,
                  artwork_name:  question.artwork.name
  end

  def resolve_grade(response_name:, artwork_name:)
    case @style
    when :given_name_style
      true
    when :exact_name_style
      response_name.downcase == artwork_name.downcase
    when :similar_name_style
      levenshtein_distance(response_name, artwork_name) <= 5
    end
  end

  def levenshtein_distance(s, t)
  m = s.length
  n = t.length
  return m if n == 0
  return n if m == 0
  d = Array.new(m+1) {Array.new(n+1)}

  (0..m).each {|i| d[i][0] = i}
  (0..n).each {|j| d[0][j] = j}
  (1..n).each do |j|
    (1..m).each do |i|
      d[i][j] = if s[i-1] == t[j-1]  # adjust index into string
                  d[i-1][j-1]       # no operation required
                else
                  [ d[i-1][j]+1,    # deletion
                    d[i][j-1]+1,    # insertion
                    d[i-1][j-1]+1,  # substitution
                  ].min
                end
    end
  end
  d[m][n]
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
