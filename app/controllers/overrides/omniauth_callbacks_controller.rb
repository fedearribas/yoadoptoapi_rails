module Overrides
  class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
    protected
    
    def get_resource_from_auth_hash
      # find or create user by provider and provider uid
      @resource = resource_class.where({
        uid:      auth_hash['uid'],
        provider: auth_hash['provider'],
      }).first_or_initialize

      puts "====== LA HASH INFO ES #{auth_hash['info']} ======"
      puts "====== LA IMAGEN DE HASH INFO ES #{auth_hash['info']['image']} ======"
      
      if @resource.new_record?
        @oauth_registration = true
        set_random_password
      end
      
      # sync user info with provider, update/generate auth token
      assign_provider_attrs(@resource, auth_hash)
      
      @resource.image = auth_hash['info']['image']
      @resource.remote_image_url = auth_hash['info']['image']
      
      # assign any additional (whitelisted) attributes
      extra_params = whitelisted_params
      @resource.assign_attributes(extra_params) if extra_params
      @resource
    end
  end
end
