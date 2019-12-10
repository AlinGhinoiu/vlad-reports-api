class RefreshTokenJob < ApplicationJob
  queue_as :urgent

  def perform user:
    RefreshToken.new(user: user).call
  end
end
