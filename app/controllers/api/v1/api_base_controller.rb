class Api::V1::ApiBaseController < ActionController::Base

  def error_with_message(message = "looks like something went wrong", http_status_code = 400)
    render inline: %Q| json.result "error"; json.error "#{message}"; |, status: http_status_code,  type: :jbuilder
  end

end
