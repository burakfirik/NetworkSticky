require 'spec_helper'

describe Note do

  it "has a valid factory" do
    FactoryGirl.create(:note).should be_valid
  end

  context "#validations" do
    it { should validate_presence_of :name }
  end

  context "#associations" do
    it { should belong_to :user }
    it { should have_many :contents }
  end
end
