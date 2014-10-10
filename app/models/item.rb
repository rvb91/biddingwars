class Item < ActiveRecord::Base
  
  belongs_to :user, foreign_key: "userId"
  belongs_to :won_items, class_name:"User", foreign_key:"winnerId"
  has_many :bids
    
  validates :userId, presence: true, numericality: { only_integer: true }
  validates :itemName, presence: true, length: {maximum: 500}
  validates :startPrice, presence: true, numericality: { only_integer: true, in: 1...1000000 }
  validate :check_owner
  
  def check_owner    
    errors.add(:userId, "does not exist") unless User.find_by( userId: self.userId)
  end
  
  def current_highest_bid
    bid = Bid.where(userId: self.winnerId).where(item_id: self.id).last
    bid ? bid : nil 
  end
  
  def current_highest_bidder
    if self.winnerId 
      return User.find_by( userId: winnerId) 
    else
      nil
    end
  end
  
  def declare_winner
    winning_bid = self.current_highest_bid
    
    unless winning_bid.nil?
      Item.transaction do 
        update_attributes!(isActive: false, winnerId: winning_bid.userId, winningAmt: winning_bid.amount)
        User.find_by(userId:winning_bid.userId).decrement_budget_by(self.winningAmt)
        winning_bid.release_funds
      end
    else
      update_attributes(isActive: false, winnerId: 0, winningAmt: 0)
    end
  end
  
  def isActive?
    isActive ? true : false
  end
  
  def new_bid(bid_amount, user_instance)
    if bid_amount > self.winningAmt.to_i
      
      c = self.current_highest_bid
      
      Item.transaction do
        c.release_funds unless c.nil?
        Bid.push(user_instance.id, bid_amount, self.id)
        update_attributes!(winningAmt:bid_amount, winnerId: user_instance.userId)
      end
      
      return true
    else
      return false
    end 
  end
end
