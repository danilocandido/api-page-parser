class Api::V1::PageResource < JSONAPI::Resource
  model_name 'Page'

  paginator :none
  attributes :content
end
