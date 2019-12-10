class User < ApplicationRecord
  attr_encrypted :access_token,
    key: ENV['SECRET_KEY_BASE'],
    salt: ENV['ENCRYPTION_SERVICE_SALT']
  attr_encrypted :refresh_token,
    key: ENV['SECRET_KEY_BASE'],
    salt: ENV['ENCRYPTION_SERVICE_SALT']
end
