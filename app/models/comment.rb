class Comment < ApplicationRecord
  belongs_to :contents
  belongs_to :user
end
