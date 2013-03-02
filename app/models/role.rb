class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  scopify
  @@manager_id = nil  
  after_save :load_manager_id, :if => Proc.new { Role.manager_id.nil? }
  
  def self.manager_id
    @@manager_id
  end
  
  private
  
  def load_manager_id
    @@manager_id = Role.find_by_name("manager").try(:id)
  end
  
end
