class AdoptionsController < ApplicationController
  before_action :set_adoption, only: [:show, :update, :destroy]
  before_action :set_user, except: [:index]

  # GET /adoptions
  def index
    @adoptions = Adoption.all

    render json: @adoptions
  end

  # GET /adoptions/1
  def show
    render json: @adoption
  end

  # POST /adoptions
  def create
    #@adoption = Adoption.new(adoption_params)
     @adoption = @user.adoptions.new(convert_data_uri_to_upload(adoption_params))
    #@adoption = Adoption.new(convert_data_uri_to_upload(adoption_params))

    if @adoption.save
      render json: @adoption, status: :created, location: @adoption
    else
      render json: @adoption.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /adoptions/1
  def update
    if @adoption.update(adoption_params)
      render json: @adoption
    else
      render json: @adoption.errors, status: :unprocessable_entity
    end
  end

  # DELETE /adoptions/1
  def destroy
    @adoption.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption
      @adoption = Adoption.find(params[:id])
    end
    
    #Set the current user who is posting the adoption
    def set_user
      @user = User.find(params[:user][:id])
    end

    # Only allow a trusted parameter "white list" through.
    def adoption_params
      params.require(:adoption).permit(:name, 
                                      :age, 
                                      :age_measurement_unit, 
                                      :image, 
                                      :adopted, 
                                      :description, 
                                      :published_date, 
                                      :contact_phone, 
                                      :contact_email, 
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

		    img_params = {:filename => "#{obj_hash[:name]}_image.#{image_data[:extension]}", :type => image_data[:type], :tempfile => temp_img_file}
		    uploaded_file = ActionDispatch::Http::UploadedFile.new(img_params)
		    obj_hash.delete(:image)
		    obj_hash[:image] = uploaded_file
		  end
    	return obj_hash    
    end
    
end
