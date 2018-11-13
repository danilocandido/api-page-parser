## Pre-requisites
ruby 2.5.1

## INSTALL
bundle install

## RUN
rails s

## Aditional gems
- Specs
  - rspec-rails
  - factory_bot_rails

- Application
  - rack-cors (edit cors.rb to enable Cross-Origin Resource Sharing)
  - jsonapi-resources

## The API
GET  localhost:3000/api/v1/pages

--

POST localhost:3000/api/v1/pages
  Header
    Content-Type: application/vnd.api+json
    Accept: application/vnd.api+json

  body
    {
      "data": {
        "type": "pages",
        "attributes": {
          "content": "http://en.wikipedia.org/"
        }
      }
    }

## Routes
> GET   /api/v1/pages(.:format)  api/v1/pages#index
> POST  /api/v1/pages(.:format)  api/v1/pages#create
  
## ApplicationController
ApplicationController extends from JSONAPI::ResourceController

## Services
I created a service caled PageWrapper that wrappers the extract url.
> page_wrapper_spec.rb

## Model
Page with atribute 'content' (JSONB)

## TDD
I use TDD to create my specs controllers, models and services
