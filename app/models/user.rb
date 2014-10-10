class User < ActiveRecord::Base
  
  
  has_many :bids
  has_many :items, foreign_key: "userId", primary_key: "userId"
  has_many :won_items, class_name: "Item", foreign_key: "winnerId", primary_key:"userId"
  
  
  validates :userId, presence:true, numericality: { in: 1..1000000}, uniqueness:true
  validates :budget, presence:true, numericality: { in: 1..1000000}

  def available_budget
    budget - blocked_budget
  end

  def blocked_budget
    b = Bid.where(userId: self.userId, payment_blocked:true).sum(:amount)
    b ? b : 0
  end

  def can_bid_on_item?(amount, item)
    
    if self.userId == item.userId
      return false
    elsif item.winnerId > 0 && self.userId == item.current_highest_bidder.id
      self.funds_available?(amount.to_i - item.current_highest_bid.amount)
    else
      self.funds_available?(amount)
    end
  end
  
  def owned_items
    self.won_items.where(isActive:false)
  end
  
  def funds_available?(amount)
    available_budget >= amount.to_i ? true : false
  end
    
  def decrement_budget_by(amount)
    if self.budget >= amount
      self.budget -= amount
      self.save!
      return true
    else
      return false
    end
  end
  
end
