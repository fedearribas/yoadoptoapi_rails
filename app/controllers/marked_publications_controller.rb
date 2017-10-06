class MarkedPublicationsController < ApplicationController
  before_action :set_marked_publication, only: [:show, :update, :destroy]

  # GET /marked_adoptions
  def index
    @marked_adoptions = MarkedPublication.all

    render json: @marked_publications
  end

  # GET /marked_adoptions/1
  def show
    render json: @marked_publication
  end
  
  #GET /marked_adoptions/user/1
  def get_by_user_id_and_publication_type
    @marked_publications = MarkedPublication.where(user_id: params[:user_id], publication_type: params[:publication_type]).order('created_at DESC')
    render json: @marked_publications
  end
  
  def get_by_user_id_and_publication_id
    @marked_publication = MarkedPublication.where(user_id: params[:user_id], publication_id: params[:publication_id]).first()
     render json: @marked_publication
  end

  # POST /marked_adoptions
  def create
    @marked_publication = MarkedPublication.new(marked_publication_params)

    if @marked_publication.save
      render json: @marked_publication, status: :created, location: @marked_publication
    else
      render json: @marked_publication.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /marked_adoptions/1
  def update
    if @marked_publication.update(marked_publication_params)
      render json: @marked_publication
    else
      render json: @marked_publication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /marked_adoptions/1
  def destroy
    @marked_publication.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marked_publication
      @marked_publication = MarkedPublication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def marked_publication_params
      params.require(:marked_publication).permit(:publication_id, :user_id, :publication_type)
    end
end
