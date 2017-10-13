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
  
end
