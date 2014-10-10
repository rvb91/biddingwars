class Api::V1::ItemsController < Api::V1::ApiBaseController
  
  before_filter :find_item, only:[:bid, :finish]
  before_filter :find_user, only:[:add, :bid]
  
  
  def add
    @item = Item.new(itemName:params[:itemName], startPrice:params[:startPrice], userId:params[:userId])
    
    if @item.valid?
      @item.save
    else
      error_with_message(@item.errors.to_a.join(", ")) and return
    end
  end
  
  def bid
    if @item.isActive == false
      error_with_message("auction closed") and return
    end
    
    if @user.can_bid_on_item?(params[:amount], @item) 
      begin 
        if @item.new_bid(params[:amount].to_i, @user) == false
          error_with_message("invalid amount") and return
        end
        #Optimistic locking error catching
      rescue ActiveRecord::StaleObjectError => e
        error_with_message("A bid higher than your's was placed before we could process your bid, please revise your bid amount", 409) and return
      end
    else
      error_with_message("insufficient funds") and return
    end
  end
  
  # GET /finish?itemId=1
  def finish
    @item.declare_winner
  end
  
  def snapshot
    @auctions = Item.all
    @users = User.includes(:won_items).all
  end
  
  private 
  def find_item
    
    if params[:itemId].blank?
      error_with_message("itemId param is required")
    end
    
    @item = Item.find_by(id: params[:itemId].to_i)
    if @item.nil?
      error_with_message("item not found") and return
    end
  end

  def find_user
    
    if params[:userId].present?
      @user = User.find_by(userId: params[:userId])
      if @user.nil?
        error_with_message("user not found", 404)
      end
    else
      error_with_message("userId missing") and return
    end 
  end
end
