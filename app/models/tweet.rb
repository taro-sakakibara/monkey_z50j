class Tweet < ApplicationRecord

  with_options presence: true do
    validates :text,length:{maximum:140}
    validates :category_id, numericality: { other_than: 1 }
    validates :image
  end

 belongs_to :user
 belongs_to :category
 has_many :comments, dependent: :destroy
 has_one_attached :image
end
