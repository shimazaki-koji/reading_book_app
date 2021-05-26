class Book < ApplicationRecord
  #has_many :wrap_up
  #has_many :comments
  belongs_to :user
  has_one_attached :image
  has_many :comments

  #extend ActiveHash::Associations::ActiveRecordExtensions
    #belongs_to_active_hash :contents

  with_options presence: true do
    validates :title
    validates :learn
    validates :contents
  end

  def self.search(search)
    if search != ""
      Book.where('text LIKE(?)', "%#{search}%")
    else
      Book.all
    end
  end
  
  #def was_attached?
    #image.was_attached?
  #end
end