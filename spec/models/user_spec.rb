require 'spec_helper'

describe User do
  
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  context '#validations' do
    it { should validate_presence_of :email } 
    it { should validate_uniqueness_of :email } 
    it { should validate_presence_of :password } 
  end

  context '#associations' do
    it { should have_many :notes }
    it { should have_many :shared_notes }
  end

end
