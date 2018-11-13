require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users' do
  header 'Accept', 'application/vnd.api+json'
  header 'Content-Type', 'application/vnd.api+json'

  route '/api/v1/pages/', 'Retrieve Pages' do
    get 'last extracted pages' do
      example 'Get a list of extracted pages' do
        5.times { create(:page) }

        do_request

        expect(status).to eq 200
        expect(response_body).to be_json_api_response_for('pages')
      end
    end
  end

  route '/api/v1/pages/', 'Create a Page' do
    attribute :data, "the document's primary data", require: true
    attribute :type, 'the model type', require: true
    attribute :attributes, 'the model attributes', require: true
    attribute :content, 'the url of the page', require: true

    data = { data: {
        type: 'pages',
        attributes: {
          content: 'http://en.wikipedia.org/'
        }
      }
    }

    let(:request) { data }

    post 'extract tags' do
      let(:raw_post) { params.to_json }
      example 'creating page' do
        do_request(request)
        expect(status).to eq 201
      end
    end
  end
end
