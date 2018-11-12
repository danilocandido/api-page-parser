require 'rails_helper'

RSpec.describe Api::V1::PagesController, type: :request do
  describe 'GET #index' do
    it 'return content tags' do
      page = create(:page)
      get api_v1_pages_path, params: {}
      expect(response.status).to eq(200)
      expect(response.body).to be_json_api_response_for('pages')
    end
  end
end
