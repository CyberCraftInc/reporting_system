class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :messages, :dependent => :destroy
  validates_presence_of :login
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "User" if self.role.nil?
  end

  def superadmin?
    if self.role != nil 
      self.role.name == "Super Admin"
    else
      false
    end
  end

  def admin?
    if self.role != nil 
    self.role.name == "Admin"
    else
      false
    end
  end

  def user?
    if self.role != nil 
    self.role.name == "User"
    else
      false
    end
  end

  def guest?
    if self.role != nil 
    self.role.name == "Guest"
    else
      false
    end
  end

  def send_devise_notification(notification, *args)
  	devise_mailer.send(notification, self, *args).deliver_later
  end
  
end
