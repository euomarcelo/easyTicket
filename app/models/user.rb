class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :tickets #TOOD excluir isso depois
  has_many :offers
  has_many :purchases
  has_many :bid_offers

  validates :balance, :numericality => { :greater_than_or_equal_to => 0 }
end