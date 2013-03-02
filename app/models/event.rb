class Event < ActiveRecord::Base

  class EventError < StandardError; end
  
  attr_accessible :duration, :level, :location, :name, :time, :description, :owner_id


  has_many :attendance
  has_many :attendees, :through => :attendance, :source => :user, :uniq => true
  
  validates_presence_of :name
  
  after_initialize :set_defaults
  before_save :set_host_name
  
  scope :available, where('time >= ?', Time.now)
  scope :outdated, where('time < ?', Time.now)

  @@LEVEL = {
    :all            => 1,
    :followers_only => 2,
    :specified      => 3

  }
  
  def self.LEVEL
    @@LEVEL
  end
  
  private
  
  def set_defaults
    self.time ||= Time.now
    self.level ||= @@LEVEL[:all]
    self.duration ||= 1.hour
  end
  
  def set_host_name
    self.host_name = owner.name
  end
end
