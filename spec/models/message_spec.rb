require 'rails_helper'

RSpec.describe Message  do
  it "has a valid factory" do
    subject = FactoryGirl.build(:message)

  	expect(subject).to be_valid
  end
end
