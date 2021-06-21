class ApplicationController < ActionController::Base
  # 200 Success
  def response_success(class_name, action_name)
    flash[:success] = "Success #{class_name.capitalize} #{action_name.capitalize}"
  end

  # 500 Internal Server Error
  def response_internal_server_error
    flash[:warning] = '書籍が見つからないため登録できませんでした'
  end
end
