class Category < ApplicationRecord
  belongs_to :parent, class_name: Category.name, optional: true
  has_many :children, class_name: Category.name, foreign_key: :parent_id,
           dependent: :destroy

  scope :root_categories, ->{where(parent_id: nil)}

  def is_root?
    parent_id.nil?
  end

  def is_parent?
    !children.empty?
  end

end
