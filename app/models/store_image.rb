class StoreImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :first_name, :last_name, presence: true
end
