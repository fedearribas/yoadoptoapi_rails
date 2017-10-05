class MarkedAdoptionSerializer < ActiveModel::Serializer
  attributes :id, :publication_type
  belongs_to :user
  belongs_to :adoption
end
