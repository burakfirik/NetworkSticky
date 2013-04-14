require 'spec_helper'

describe SharedNote do

  it "has a valid factory" do
    FactoryGirl.create(:shared_note).should be_valid
  end

  context "#associations" do
    it { should belong_to :user }
  end
end
