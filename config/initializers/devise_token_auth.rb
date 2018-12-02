Devise.setup do |config|
  config.secret_key = 'c31f184a6f0a073262496b66358d61a8daba9926a3b2e7365c791f81274c4f081826c780613edd4f0049891b843e177982e1958662b42eab83b67aa2eaef336b'

  require 'devise/orm/active_record'
  config.authentication_keys   = [:nickname]
  config.case_insensitive_keys = [:nickname]
  config.strip_whitespace_keys = [:nickname]
  config.navigational_formats  = [:json]
  config.skip_session_storage  = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.expire_all_remember_me_on_sign_out = true
  config.sign_out_via = :delete
  config.password_length = 8..128
end

DeviseTokenAuth.setup do |config|
  config.change_headers_on_each_request = false
  config.check_current_password_before_update = :password
end

DeviseTokenAuth::Concerns::ResourceFinder.module_eval do
  def provider
    'nickname'
  end
end
