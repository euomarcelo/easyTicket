class AddIsApprovedToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :isApproved, :boolean
  end
end
