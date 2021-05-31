class Content < ApplicationRecord
  belongs_to :book
  has_many :comments

  validates :write_down, presence: true

end