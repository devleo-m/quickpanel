class Banner < ApplicationRecord
  validates :image_url, presence: true
end