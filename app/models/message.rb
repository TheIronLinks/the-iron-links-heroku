class Message < ActiveRecord::Base
  def set_as_read
    self.viewed = true
    self.save
  end

  def sender_email
    Employer.find(self.sender_id).name
  end
end
