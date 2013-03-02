class PersonalEvent < Event
  belongs_to :owner, :class_name => "User"

  validate do
    if owner.nil?
      if Rails.env == "development"
        raise EventError, "Event cannot be created through some_user.event.create(/new/build)"
      else
        errors[:creation] << "Event cannot be created through some_user.event.create(/new/build)"
      end
    else
      attendees << owner unless attendees.include? owner
    end
  end
end