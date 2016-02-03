class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :respond]

  # GET /artists/new
  def new
    @artist = Artist.new
    @artist.build_name
    @artist.build_birth_date
  end

  def show
    @question.build_name_response
    @question.build_artist_response
    @question.build_year_response
  end

  def respond
    @name_res = Response.new answer: response_params[:name_response][:answer]
    @artist_res = Response.new answer: response_params[:artist_response][:answer]
    @year_res = Response.new answer: response_params[:year_response][:answer]
    @loc_res = Response.new answer: response_params[:location_response][:answer]
    @question.update name_response: @name_res, artist_response: @artist_res, year_response: @year_res, location_response: @loc_res
    @question.score
  end

  # POST /artists
  # POST /artists.json
  def create
    @config = TestConfiguration.create(artist_params)
    @test = Test.create test_configuration: @config
    @test.questions = Artwork.all.map do |a|
      Question.new(artwork: a)
    end
    @test.save
    redirect_to start_test(@test)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question_index = params[:id].to_i
      @question = Test.find(params[:test_id]).questions[params[:id].to_i]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:question).permit(
        name_response: [:answer],
        year_response: [:answer],
        artist_response: [:answer],
        location_response: [:answer]
      )
    end
end
