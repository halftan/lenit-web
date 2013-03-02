require 'spec_helper'

describe Authentication do
  
  describe "must belong to user" do
    it { should respond_to :user }
    it { should respond_to :user_id }
  end
end
