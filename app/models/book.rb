class Book < ApplicationRecord
  #has_many :wrap_up
  #has_many :comments
  #has_one_attached :image
  #belongs_to :user

  #extend ActiveHash::Associations::ActiveRecordExtensions
    #belongs_to_active_hash :contents

  with_options presence: true do
    validates :title
    validates :learn
    validates :contents
  end

end
