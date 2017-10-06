class PublicationSerializer < ActiveModel::Serializer
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
    :created_at,
    :publication_type,
    :found,
    :delivered
  belongs_to :user
end


