class Message < ActiveRecord::Base
  def set_as_read
    self.viewed = true
    self.save
  end
end
