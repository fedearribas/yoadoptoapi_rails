class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :update, :destroy]
  before_action :set_user, only: [:create, :update]

  # GET /publications
  def index
    @publications = Publication.all.order('created_at DESC')

    render json: @publications
  end
  
  def get_publications_by_type
    @publications = Publication.where(publication_type: params[:publication_type]).order('created_at DESC')
    render json: @publications
  end


  # GET /publications/1
  def show
    render json: @publication
  end

  # POST /publications
  def create
    #Guardo la publicacion asociandola al usuario
     @publication = @user.publications.new(convert_data_uri_to_upload(publication_params))

    if @publication.save
      render json: @publication, status: :created, location: @publication
    else
      render json: @publication.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /publications/1
  def update
    #Obtengo desde el header el usuario que intenta modificar, y solo se permite si es el mismo 
    @current_user = User.find(request.headers["CURRENTUSERID"].to_i)
    if @current_user.id == @user.id || @current_user.admin
      if @publication.update(convert_data_uri_to_upload(publication_params))
        render json: @publication
      else
        render json: @publication.errors, status: :unprocessable_entity
      end
    else
      render json: "No tiene permisos para editar esta publicación.", status: :unprocessable_entity
    end
  end

  # DELETE /publications/1
  def destroy
    @publication.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end
    
    #Set the current user who is posting the publication
    def set_user
      @user = User.find(params[:user][:id])
    end

    # Only allow a trusted parameter "white list" through.
    def publication_params
      params.require(:publication).permit(:name, 
                                      :age, 
                                      :age_measurement_unit, 
                                      :image, 
                                      :adopted, 
                                      :description, 
                                      :published_date, 
                                      :contact_phone, 
                                      :contact_email, 
                                      :location,
                                      :publication_type,
                                      :found,
                                      :delivered,
                                      user: [:id])
    end
    
    #Image Upload and decoding base64
    def split_base64(uri_str)
		  if uri_str.match(%r{^data:(.*?);(.*?),(.*)$})
		    uri = Hash.new
		    uri[:type] = $1 # "image/gif"
		    uri[:encoder] = $2 # "base64"
		    uri[:data] = $3 # data string
		    uri[:extension] = $1.split('/')[1] # "gif"
		    return uri
		  else
		    return nil
		  end
    end

    def convert_data_uri_to_upload(obj_hash)
		  if obj_hash[:image].try(:match, %r{^data:(.*?);(.*?),(.*)$})
		    image_data = split_base64(obj_hash[:image])
		    image_data_string = image_data[:data]
		    image_data_binary = Base64.decode64(image_data_string)

		    temp_img_file = Tempfile.new("")
		    temp_img_file.binmode
		    temp_img_file << image_data_binary
		    temp_img_file.rewind

		    img_params = {:filename => "#{obj_hash[:name]}_image_#{Time.now.to_i}.#{image_data[:extension]}", :type => image_data[:type], :tempfile => temp_img_file}
		    uploaded_file = ActionDispatch::Http::UploadedFile.new(img_params)
		    obj_hash.delete(:image)
		    obj_hash[:image] = uploaded_file
		  end
    	return obj_hash    
    end
    
end
