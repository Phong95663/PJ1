class Image < ApplicationRecord
  belongs_to :product
  mount_uploader :image, ImageUploader

  # scope :get_avatar, ->{where(avatar: true).first}

  def self.get_avatar
    where(avatar: true).first
  end

  def name
    image.url.to_s.split("/").last
  end


end
