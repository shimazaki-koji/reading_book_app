class Book < ApplicationRecord
  belongs_to :user
  has_many :contents, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :learn
    validates :genre
  end

  def self.search(search)
    if search != ""
      Book.where('text LIKE(?)', "%#{search}%")
    else
      Book.all
    end
  end
  
  def was_attached?
    image.was_attached?
  end
end