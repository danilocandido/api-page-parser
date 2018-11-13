class Api::V1::PageResource < JSONAPI::Resource
  model_name 'Page'

  paginator :none
  attributes :content

  before_save :authorize_create

  def authorize_create
    page_content = PageWrapper.new(content)
    self.content = page_content.to_json
  end
end
