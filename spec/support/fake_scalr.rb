# spec/support/fake_scalr.rb
require 'sinatra/base'

class FakeScalr < Sinatra::Base
  # list
  get '/api/v1beta0/*/scripts/' do
    json_response 200, 'list_scripts.json'
  end

  # list versions
  get '/api/v1beta0/*/scripts/1/script-versions/' do
    json_response 200, 'versions_scripts.json'
  end

  # create script
  post '/api/v1beta0/*/scripts/' do
    json_response 200, 'create_script.json'
  end

  # create script version
  post '/api/v1beta0/*/scripts/1/script-versions/' do
    json_response 200, 'create_version_script.json'
  end

  # update script version
  patch '/api/v1beta0/*/scripts/1/script-versions/1/' do
    json_response 200, 'update_version_script.json'
  end

  # execute script
  post '/api/v1beta0/*/scripts/1/actions/execute' do
    json_response 200, 'execute_script.json'
  end

  # execute script version
  post '/api/v1beta0/*/scripts/1/script-versions/1/actions/execute' do
    json_response 200, 'execute_version_script.json'
  end

  # list farms
  get '/api/v1beta0/*/farms/' do
    json_response 200, 'list_farms.json'
  end

  # get farm
  get '/api/v1beta0/*/farms/100' do
    json_response 200, 'get_farm.json'
  end

  # list farm servers
  get '/api/v1beta0/*/farms/101/servers/' do
    json_response 200, 'list_farm_servers.json'
  end

  # list servers
  get '/api/v1beta0/*/servers/' do
    json_response 200, 'list_servers.json'
  end

  # list images
  get '/api/v1beta0/user/1/images/' do
    json_response 200, 'list_images.json'
  end

  # delete image
  delete '/api/v1beta0/user/1/images/1' do
    json_response 200, nil
  end

  # create image
  post '/api/v1beta0/user/1/images/' do
    json_response 200, 'create_image.json'
  end

  # list roles
  get '/api/v1beta0/user/1/roles/' do
    json_response 200, 'list_roles.json'
  end

  # create role
  post '/api/v1beta0/user/1/roles/' do
    json_response 201, 'create_role.json'
  end

  # list role images
  get '/api/v1beta0/user/1/roles/1/images' do
    json_response 200, 'list_role_images.json'
  end

  # associate image with role
  post '/api/v1beta0/user/1/roles/1/images' do
    json_response 200, 'associate_image_role.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
