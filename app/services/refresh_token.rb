class RefreshToken < Mautic
  def initialize user:
    @user = user
  end

  def call
    refresh
    update
  end

  private

  def refresh
    @new_token = access_token.refresh!
  end

  def update
    @user.update!(
      access_token: @new_token.token,
      refresh_token: @new_token.refresh_token
    )
  end
end
