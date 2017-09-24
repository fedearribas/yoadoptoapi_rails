class Adoption < ApplicationRecord
    mount_uploader :image, AdoptionUploader
    mount_base64_uploader :image, AdoptionUploader
    belongs_to :user
end
