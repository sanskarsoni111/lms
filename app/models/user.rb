class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :subordinates, :class_name => "User"
  belongs_to :manager, :class_name => "User", :foreign_key => "manager_id"
  belongs_to :role
  has_many :leaves
  has_many :leaves_to_approve, :class_name => "Leave", :foreign_key => "manager_id"
  validates :email, :name,:password,:manager_id, :role_id, :presence => true
   def is_admin?
    self.role.name.downcase == "admin" if self.role_id
  end

  def is_manager?
    self.role.name.downcase == "manager" if self.role_id
  end
  
end
       

