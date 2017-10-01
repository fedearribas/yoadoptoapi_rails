class MarkedAdoptionSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  belongs_to :adoption
end
