require 'spec_helper'

describe Provider do
  
  before :each do
    @attr = { :name => "provider",
              :description => "Not exist" }
  end
    
  before :all do
    @manager =  FactoryGirl.create :manager
  end
  
  it "should have a manager" do
    Provider.new.should respond_to :manager
  end
  
  describe "owner" do
      
    it "should be a user" do
      @manager.should be_an_instance_of User
    end
  end
  
  describe "events" do
    before :each do
      @attr = { :name => 'nnn', :time => Time.now, :level => Event.LEVEL[:all] }
      @provider = FactoryGirl.create :provider
      @provider.manager = @manager
      @provider.save!
    end
    
    it "can be hosted" do
      @provider.provided_events.create!(@attr)
    end
    
    it "can have attendees" do
      event = @provider.provided_events.create!(@attr)
      attandee = FactoryGirl.create :user
      attandee.events << event
      @provider.provided_events.should include event
      attandee.events.should include event
    end
  end
end