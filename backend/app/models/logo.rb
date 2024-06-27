class Logo < ApplicationRecord
  validates :image_url, presence: true
end