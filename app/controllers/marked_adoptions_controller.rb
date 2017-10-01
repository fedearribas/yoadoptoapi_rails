class MarkedAdoptionsController < ApplicationController
  before_action :set_marked_adoption, only: [:show, :update, :destroy]

  # GET /marked_adoptions
  def index
    @marked_adoptions = MarkedAdoption.all

    render json: @marked_adoptions
  end

  # GET /marked_adoptions/1
  def show
    render json: @marked_adoption
  end
  
  #GET /marked_adoptions/user/1
  def get_by_user_id
    @marked_adoptions = MarkedAdoption.where(user_id: params[:user_id]).order('created_at DESC')
    render json: @marked_adoptions
  end
  
  def get_by_user_id_and_adoption_id
    @marked_adoption = MarkedAdoption.where(user_id: params[:user_id], adoption_id: params[:adoption_id]).first()
     render json: @marked_adoption
  end

  # POST /marked_adoptions
  def create
    @marked_adoption = MarkedAdoption.new(marked_adoption_params)

    if @marked_adoption.save
      render json: @marked_adoption, status: :created, location: @marked_adoption
    else
      render json: @marked_adoption.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /marked_adoptions/1
  def update
    if @marked_adoption.update(marked_adoption_params)
      render json: @marked_adoption
    else
      render json: @marked_adoption.errors, status: :unprocessable_entity
    end
  end

  # DELETE /marked_adoptions/1
  def destroy
    @marked_adoption.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marked_adoption
      @marked_adoption = MarkedAdoption.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def marked_adoption_params
      params.require(:marked_adoption).permit(:adoption_id, :user_id)
    end
end
