class Tweet < ApplicationRecord

  with_options presence: true do
    validates :text,length:{maximum:140}
    validates :category_id
    validates :image
  end

 belongs_to :user
 has_many :comments, dependent: :destroy
 has_one_attached :image
end
