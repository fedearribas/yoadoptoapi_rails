class Adoption < ApplicationRecord
    mount_uploader :image, AdoptionUploader
    mount_base64_uploader :image, AdoptionUploader
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :marked_adoptions, dependent: :destroy
end
