require 'spec_helper'

describe Content do

  it "has a valid factory" do
    FactoryGirl.create(:content).should be_valid
  end

  context "#validations" do
    it { should validate_presence_of :description }
  end

  context "#associations" do
    it { should belong_to :note }
  end
end
