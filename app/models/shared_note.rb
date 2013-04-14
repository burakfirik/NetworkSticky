class SharedNote < ActiveRecord::Base
  # belongs_to :note
  belongs_to :user

  attr_accessor :email
  attr_accessible :email, :note_id
  # attr_accessible :title, :body
end
