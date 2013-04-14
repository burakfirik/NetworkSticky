class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notes
<<<<<<< HEAD
  has_many :shared_notes
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def self.shareable_to?(recipient, note_id)
    recipient_id = User.find_by_email(recipient).id
    if SharedNote.where("user_id = ? AND note_id = ?", "#{recipient_id}", "#{note_id}").empty?
      return true
    else
      return false
    end
  end

  def all_notes
    notes = self.notes.map {|n| n.id}
    shared = self.shared_notes.map {|s| s.note_id}

    @notes = []

    for note in notes
      @notes.push Note.find(note)
    end
    for shared_note in shared
      @notes.push Note.find(shared_note)
    end
    @notes
  end
=======
  attr_accessible :email, :password, :password_confirmation, :remember_me
>>>>>>> 36a2f3959683644bcb532aad8e692ce805cf3d76
end
