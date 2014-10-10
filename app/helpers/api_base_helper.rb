module ApiBaseHelper
  
  def errors_from_model(instance)
    instance.errors.to_a.join(", ")
  end
  
end