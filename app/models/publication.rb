class Publication < ApplicationRecord
    mount_uploader :image, PublicationUploader
    mount_base64_uploader :image, PublicationUploader
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :marked_publications, dependent: :destroy
end
