class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable

  has_many :personal_events, :foreign_key => "owner_id"
  
  has_many :providers, :foreign_key => "manager_id"

  has_many :attendance
  has_many :attended_events, :through => :attendance, :source => :event
  
  # Following and Followers
  has_many :followings
  has_many :followeds, :through => :followings, :source => 'followed', :uniq => true
  
  has_many :be_following, :class_name => 'Following', :foreign_key => 'followed_id'
  has_many :followers, :through => :be_following, :source => :user, :uniq => true

  has_many :authentications, :dependent => :destroy

  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  validates_uniqueness_of :name, :email

  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  before_save :ensure_authentication_token
  after_save :add_manager, :unless => :is_manager?
  
  @@ROLES = YAML.load(ENV['ROLES'])
  
  def self.roles
    @@ROLES
  end
  
  def follow! other
    if other.is_a? User
      self.followeds << other
    elsif other.is_a? Fixnum
      self.followeds << User.find(other)
    else
      raise ArgumentError, "Argument class not match."
    end
  end
  
  def unfollow! other
    if other.is_a? User
      self.followeds.delete other
    elsif other.is_a? Fixnum
      self.followeds.delete User.find(other)
    else
      raise ArgumentError, "Argument class not match."
    end
  end
  
  def get_all_events
    t = []
    if has_role? :manager
      t = ProvidedEvent.where(:owner_id => provider_ids).to_a
    end
    t += personal_events.available.to_a
    return t
  end
  protected
  
  def is_manager?
    self.role_ids.include? Role.manager_id
  end

  def add_manager
    self.add_role :manager
  end
end
