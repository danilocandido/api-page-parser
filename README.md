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
  ```
    {
      "data": {
        "type": "pages",
        "attributes": {
          "content": "http://en.wikipedia.org/"
        }
      }
    }
  ```

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

## API Documentation
There is a folder named doc that contains the api documentation.
You can open the index.html page in your browser to seet the complete documentation

> ./doc/api/index.html

### to generate the documentation I used 'rspec_api_documentation' gem  
create the spec/acceptance specs

Finaly I run the command below.
> rake docs:generate
