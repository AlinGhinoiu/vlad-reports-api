class Mautic
  AUTHORIZE_URL = 'oauth/v2/authorize'.freeze
  TOKEN_URL = '/oauth/v2/token'.freeze
  ENTITY_LIMIT = 3000

  def initialize user:
    @user = user
  end

  def client
    OAuth2::Client.new(
      ENV['MAUTIC_PUBLIC_KEY'],
      ENV['MAUTIC_SECRET_KEY'],
      site: ENV['MAUTIC_URL'],
      authorize_url: AUTHORIZE_URL,
      token_url: TOKEN_URL
    )
  end

  def access_token
    OAuth2::AccessToken.new(
      client,
      @user.access_token,
      refresh_token: @user.refresh_token
    )
  end
end
