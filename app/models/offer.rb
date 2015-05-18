class Offer < ActiveRecord::Base
  
  def self.search(term)
    if term
      find(:all, :conditions => ['name LIKE ?', "%#{term}%"])
    else
      find(:all)
    end
  end
end
