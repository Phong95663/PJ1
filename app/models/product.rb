class Product < ApplicationRecord
  has_many :images, :dependent => :delete_all
  belongs_to :category, required: false
  attr_accessor :avatar

  def avatar
    images.get_avatar
  end

  def avatar= id
    avatar.update_attributes(avatar: false) unless avatar.nil?
    m_image = Image.find_by id: id
    m_image.update_attributes avatar: true
  end

  def update_quantity m_quantity
    increment!(:quantity, m_quantity)
  end

end