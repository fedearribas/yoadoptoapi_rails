class AdoptionSerializer < ActiveModel::Serializer
  attributes :id, 
    :name,
    :age,
    :age_measurement_unit,
    :image,
    :adopted,
    :description,
    :published_date,
    :contact_phone,
    :contact_email,
    :created_at,
    :marked_adoptions
  belongs_to :user
  has_many :comments
    has_many :marked_adoptions
end


