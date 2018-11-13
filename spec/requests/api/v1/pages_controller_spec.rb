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
    let(:headers) { { 'Content-Type': 'application/vnd.api+json',
                      'Accept': 'application/vnd.api+json'
                  }}

    it 'return content tags' do
      data = { data: {
          type: 'pages',
          attributes: {
            content: 'http://en.wikipedia.org/'
          }
        }
      }

      post api_v1_pages_path, params: data, as: :json, headers: headers

      expect(response.status).to eq(201)
      json = JSON.parse response.body
      expect(json['data']['attributes']['content']['h1']).to eq 'Main Page'
    end
  end
end
