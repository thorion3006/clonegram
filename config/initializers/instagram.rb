# This file initializes the Instagram gem modules
require "instagram"

Instagram.configure do |config|
    config.client_id = Rails.application.secrets.client_id
    config.client_secret = Rails.application.secrets.client_secret
    config.sign_requests = true
    scope = 'basic+media+public_content+follower_list+comments+relationships+likes'
end