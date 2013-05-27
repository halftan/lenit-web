require 'spec_helper'

describe Event do

  describe "personal_events" do

    before :each do
      @attr = { :name => 'nnn', :time => Time.now, :level => Event.LEVEL[:all] }
      @user = FactoryGirl.create :user
    end

    it "should have a owner" do
      @event = @user.personal_events.create!(@attr)
      @event.owner.should eq @user
    end
  end

  describe "events" do

    before :each do
      @attr = { :name => 'nnn', :time => Time.now, :level => Event.LEVEL[:all] }
      @user = FactoryGirl.create :user
      @event = @user.personal_events.create!(@attr)
    end

    it "can have attendees" do
      attendee = FactoryGirl.create(:user, {:name => "Another User", :email => "aaa@bar.com"})
      @event.attendees << attendee
      attendee.attended_events.should include @event
    end

    it "attendees must include the host himself" do
      @event.attendees.should include @user
      @user.attended_events.should include @event
    end
  end
end
