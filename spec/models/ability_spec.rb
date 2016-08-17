require 'cancan/matchers'
require 'rails_helper'

RSpec.describe 'User' do
	
  describe "abilities" do
    subject(:ability){ Ability.new(user) }
    let(:user){ nil }
    
    context "when user has a superadmin role" do
      let(:role) { Role.create(name: "Super Admin", id: 1) }
      let(:user) { FactoryGirl.build(:user, role: role) }

      it { should be_able_to(:manage, Message.new) }
    end

    context "when user has an admin role" do
      let(:role) { Role.create(name: "Admin", id: 2) }
      let(:user) { FactoryGirl.build(:user, role: role) }

      it { should be_able_to(:read, Message.new) }
      it { should be_able_to(:create, Message.new) }
      it { should be_able_to(:update, FactoryGirl.build(:message, category: 'Public')) }
      it { should be_able_to(:destroy, FactoryGirl.build(:message, category: 'Public')) }
      it { should_not be_able_to(:update, FactoryGirl.build(:message, category: 'Private')) }
      it { should_not be_able_to(:destroy, FactoryGirl.build(:message, category: 'Private')) }
    end

    context "when user has a user role" do
      let(:role) { Role.create(name: "User", id: 3) }
      let(:user) { FactoryGirl.build(:user, role: role) }
      
      it { should be_able_to(:read, Message.new) }
      it { should be_able_to(:create, FactoryGirl.build(:message, category: 'Private')) }
      it { should_not be_able_to(:update, FactoryGirl.build(:message, category: 'Private')) }
      it { should_not be_able_to(:destroy, FactoryGirl.build(:message, category: 'Private')) }
    end

    context "when user has a guest role" do
      let(:role) { Role.create(name: "Guest", id: 4) }
      let(:user) { FactoryGirl.build(:user, role: role) }

      it { should be_able_to(:read, FactoryGirl.build(:message, category: 'Public')) }
      it { should_not be_able_to(:manage, FactoryGirl.build(:message, category: 'Private')) }
    end
  
  end
end
