class Note < ActiveRecord::Base
  attr_accessible :name, :contents_attributes

  belongs_to :user
  has_many :contents

  accepts_nested_attributes_for :contents, :reject_if => lambda {|content| content[:description].blank? }, :allow_destroy => true

  validates :name, :presence => true
<<<<<<< HEAD

  def shared_to?(user)
    return true if self.user_id != user.id else false
  end

  def owner
    self.user.email
  end
=======
>>>>>>> 36a2f3959683644bcb532aad8e692ce805cf3d76
end
