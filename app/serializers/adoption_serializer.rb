class AdoptionSerializer < ActiveModel::Serializer
  attributes :id, 
    :name,
    :age,
    :age_measurement_unit,
    :image,
    :adopted,
    :description,
    :published_date,
    :location,
    :contact_phone,
    :contact_email,
    :created_at
  belongs_to :user
end


