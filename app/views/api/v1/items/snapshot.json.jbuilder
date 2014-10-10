json.status "success"
json.data do 
  json.auctions do
    json.array! @auctions do |auction|
      json.extract! auction, :id, :isActive, :userId
      json.bestBidderId auction.winnerId
      json.currentPrice auction.winningAmt
    end
  end
  
  
  json.users do
    json.array! @users do |user|
      json.budget user.available_budget
      json.id user.userId
      json.blockedBudget user.blocked_budget
      json.ownedItemIds user.owned_items.pluck(:id)
    end
  end
end
