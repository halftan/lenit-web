class Provider < ActiveRecord::Base
  belongs_to :manager, :class_name => "User"
  attr_accessible :description, :name
  has_many :provided_events, :foreign_key => "owner_id"
end
