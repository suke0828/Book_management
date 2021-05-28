require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe 'GET /index' do
    it '正常にレスポンスをを返すこと' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
