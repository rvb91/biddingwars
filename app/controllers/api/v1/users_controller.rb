class Api::V1::UsersController < Api::V1::ApiBaseController
  
  # GET /users/add
  def add
    
    [:userId, :budget].each do |p|
      if params[p].blank?
        error_with_message("parameter #{p} is missing") and return
      elsif params[p].to_i <= 0
        error_with_message("The budget should be greater than 0") and return
      end
    end

    user = User.new(userId:params[:userId].to_i, budget:params[:budget].to_i)
    
    if user.valid?
      user.save
    else
      error_with_message(user.errors.to_a.join(", "), 400) and return
    end
  end
  
  
  
end
