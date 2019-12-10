class MauticsController < ApplicationController
  def authorize
    url = client.auth_code.authorize_url(
      redirect_uri: callback_mautic_url,
      grant_type: 'authorization_code'
    )

    redirect_to url
  end

  def callback
    @new_token = client.auth_code.get_token(
      params[:code],
      redirect_uri: callback_mautic_url
    )

    user.update!(
      access_token: @new_token.token,
      refresh_token: @new_token.refresh_token
    )
  end

  private

  def client
    @client ||= Mautic.new(user: user).client
  end

  def user
    User.first
  end
end
