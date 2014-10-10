class Bid < ActiveRecord::Base
  
  belongs_to :item
  belongs_to :user, foreign_key: "userId", primary_key:"userId", class_name:"User"
  
  validates :item_id, presence: true 
  validates :userId, presence: true
  validates :amount, presence: true

  validate :item_should_exist_and_be_active 
  validate :user_should_exist_and_have_funds
  
  def self.push(userId, amount, item_id)
    bid = Bid.create!(item_id:item_id, userId:userId, amount:amount)
  end
  
  def release_funds
    self.update_attributes!(payment_blocked: false)
  end
  
  
  # validations 
  def item_should_exist_and_be_active
    if Item.exists?(self.item_id)
      if self.new_record? && !self.item.isActive?
        self.errors.add(:base, "auction closed")
      end
    else
      self.errors.add(:base, "item does not exist")
    end  
  end
  
  def user_should_exist_and_have_funds
    if User.find_by(userId: self.userId)
      if self.payment_blocked && !self.user.funds_available?(self.amount)
        self.errors.add(:base, "insufficient funds")
      end
    else
      self.errors.add(:base, "user could not be found")
    end

  end
  
end
