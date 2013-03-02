class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :access_token, :expires_in, :provider, :refresh_token, :uid
end
