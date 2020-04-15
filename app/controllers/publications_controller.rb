# frozen_string_literal: true

class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[show edit update destroy]
  after_action :verify_authorized

  # GET /publications
  # GET /publications.json
  def index
    authorize Publication # Pass in MODEL Class
    @publications = Publication.paginate(page: params[:page], per_page: params[:per_page] ||= 30).order(created_at: desc)
    respond_to do |format|
      format.json { render json: Publication.all, status: :ok }
      format.html {}
    end
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    respond_to do |format|
      format.json { render json: @publication }
      format.html { @publication }
    end
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit; end

  # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)
    authorize @publication

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_publication
    @publication = Publication.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def publication_params
    params.require(:publication).permit(:article_id)
  end
end
