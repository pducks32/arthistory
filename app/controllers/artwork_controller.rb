class ArtworkController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]

  # GET /artwork
  # GET /artwork.json
  def index
    @artwork = Artwork.all
  end

  # GET /artwork/1
  # GET /artwork/1.json
  def show
  end

  # GET /artwork/new
  def new
    @artwork = Artwork.new
  end

  # GET /artwork/1/edit
  def edit
  end

  # POST /artwork
  # POST /artwork.json
  def create
    @artwork = Artwork.new(artwork_params)

    respond_to do |format|
      if @artwork.save
        format.html { redirect_to @artwork, notice: 'Artwork was successfully created.' }
        format.json { render :show, status: :created, location: @artwork }
      else
        format.html { render :new }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artwork/1
  # PATCH/PUT /artwork/1.json
  def update
    respond_to do |format|
      if @artwork.update(artwork_params)
        format.html { redirect_to @artwork, notice: 'Artwork was successfully updated.' }
        format.json { render :show, status: :ok, location: @artwork }
      else
        format.html { render :edit }
        format.json { render json: @artwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artwork/1
  # DELETE /artwork/1.json
  def destroy
    @artwork.destroy
    respond_to do |format|
      format.html { redirect_to artwork_index_url, notice: 'Artwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artwork_params
      params.require(:artwork).permit(:name, :artist_id, :medium, :image_url)
    end
end
