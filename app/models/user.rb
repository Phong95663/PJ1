class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  PEMISION = { 3 => "admin", 2 => "staff", 1 => "custom.scss" }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :phone, presence: true



  def is_admin?
    return permision == 3
  end

  def is_staff?
    return permision == 2
  end

  def is_custom?
    return permision == 1
  end

  def is role
    return PEMISION[permision] == role
  end
end
