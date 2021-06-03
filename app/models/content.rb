class Content < ApplicationRecord
  belongs_to :book
  has_many :comments

  with_options presence: true do
    validates :chapter
    validates :write_down
  end
  
end