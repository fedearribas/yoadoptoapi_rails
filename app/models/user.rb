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
   has_many :publications
   has_many :marked_publications
end
