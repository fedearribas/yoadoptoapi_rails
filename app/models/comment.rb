class Comment < ApplicationRecord
  belongs_to :adoption
  belongs_to :user
end
