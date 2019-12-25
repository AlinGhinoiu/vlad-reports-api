class StoreProfiles
  def call
    profiles
    store if @results.present?
  end

  def profiles
    response = connection.get('profiles/extended/')

    if response.status == 200
      @results = response.body['fields']
    else
      raise StandardError
    end
  end

  private

  def store
    @results.each do |result|
      profile = Profile.where(user_id: result['user_id'])

      if result['field_id'] == '2'
        profile.first_or_create!(
          sector: result['value'],
          email: result['user_email'],
          full_name: result['display_name']
        ).update(
          sector: result['value'],
          email: result['user_email'],
          full_name: result['display_name']
        )
      elsif result['field_id'] == '17'
        profile.first_or_create!(
          role: result['value'],
          email: result['user_email'],
          full_name: result['display_name']
        ).update(
          role: result['value'],
          email: result['user_email'],
          full_name: result['display_name']
        )
      end
    end
  end

  def url
    ENV['WP_URL']
  end

  def connection
    @connection ||= Faraday.new(url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
    end
  end
end
