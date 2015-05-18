class Ticket < ActiveRecord::Base
  belongs_to :user
  
  def self.search(name)
    search = "%" + name + "%"
    Ticket.where("event_name LIKE ?", search) 
  end
end