class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  SORT_COLUMNS = %w[title rating release_date].freeze

  # GET /movies or /movies.json
  def index
    # use sort from the url if it's valid, otherwise use the last one saved in session
    # (only allowed column names get passed to order, so no sql injection)
    @sort = SORT_COLUMNS.include?(params[:sort]) ? params[:sort] : session[:sort]
    @direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : session[:direction] || "asc"
    session[:sort] = @sort
    session[:direction] = @direction

    @movies = @sort ? Movie.order(@sort => @direction) : Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @movie.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @movie.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to movies_path, notice: "Movie was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def set_movie
      @movie = Movie.find(params.expect(:id))
    end

    def movie_params
      params.expect(movie: [ :title, :rating, :description, :release_date ])
    end
end
