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

  describe 'POST #create' do
    let(:headers) { { 'Content-Type': 'application/vnd.api+json' } }

    it 'return content tags' do
      params = {
        data: {
          type: 'pages',
          attributes: {
            content: {
              h1: 'http://en.wikipedia.org/'
            }
          }
        }
      }

      post api_v1_pages_path, params: params, headers: headers
      expect(response.status).to eq(200)
    end
  end
end
