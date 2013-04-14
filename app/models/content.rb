class Content < ActiveRecord::Base
  belongs_to :note
  attr_accessible :description

  validates :description, :presence => true
end
