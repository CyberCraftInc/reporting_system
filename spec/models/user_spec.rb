require 'rails_helper'

RSpec.describe User  do
  it 'has a valid factory' do
  
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'has validations presence of login' do
    user = User.create(login: nil)
    user.valid?

    expect(user.errors[:login]).to include("can't be blank")
  end

  context 'has role' do
    it 'superadmin' do
      superadmin = Role.create(id: 1, name: 'Super Admin')
      user = User.create(login: 'username', role_id: 1)

      expect(user.superadmin?).to eq true
    end
  end
  
end
