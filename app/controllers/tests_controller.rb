class TestsController < ApplicationController
  before_action :set_test, only: [:start]

  # GET /artists/new
  def new
    @artist = Artist.new
    @artist.build_name
    @artist.build_birth_date
  end

  def setup
    @test = Test.new
    @test.build_test_configuration
  end

  def start
    redirect_to test_question_path(@test, 0)
  end

  # POST /artists
  # POST /artists.json
  def create
    @config = TestConfiguration.new year_style: TestConfiguration.year_styles.key(test_params[:test_configuration][:year_style].to_i),
                                    name_style: TestConfiguration.name_styles.key(test_params[:test_configuration][:name_style].to_i),
                                    artist_style: TestConfiguration.artist_styles.key(test_params[:test_configuration][:artist_style].to_i)

    @test = Test.create test_configuration: @config
    @test.questions = Artwork.all.map do |a|
      Question.new(artwork: a)
    end
    @test.save
    redirect_to start_test_path(@test)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(
        test_configuration: [:year_style, :name_style, :artist_style]
      )
    end
end
