class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable,  
         :validatable, 
         :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :marked_publications, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :publications, dependent: :destroy
  mount_uploader :image, PublicationUploader
  mount_base64_uploader :image, PublicationUploader
  

  # Necesario para setear la imagen al loguear en facebook, no se monta y se setea el remote url
  def image=(arg)
    if !is_facebook_user?
        super
    else
        write_attribute(:image, arg)
        self.remote_image_url = arg
    end
  end

  def is_facebook_user?
      self.provider == "facebook"   
  end
  
end
