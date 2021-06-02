class ApplicationController < ActionController::Base
  # 200 Success
  def response_success(class_name, action_name)
    flash[:success] = "Success #{class_name.capitalize} #{action_name.capitalize}"
  end

  # 500 Internal Server Error
  def response_internal_server_error
    flash[:alert] = 'status: 500 Internal Server Error'
  end
end
