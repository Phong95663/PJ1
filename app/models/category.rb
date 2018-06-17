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

  def self.get_list_path
    arr = all();
    arr.map do |cate|
      {id: cate.id, path: cate.get_path}
    end
  end


  def get_path m_category = self
    m_path = '/' + m_category.name
    loop do
        break if m_category.parent_id.nil?
        m_path.prepend('/' + m_category.parent.name)
        m_category = m_category.parent
      end
    m_path
  end


end
