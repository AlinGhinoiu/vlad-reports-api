class StoreMauticSubmissions
  def initialize form_id:
    @form_id = form_id
  end

  def call
    submissions
    store if @results.present?
  end

  def submissions
    response = connection.get('submissions')

    if response.status == 200
      @results = response.body['submissions']
    elsif response.status == 401
      RefreshTokenJob.perform_later user: user
    end
  end

  def store
    @results.each do |result|
      Submission.where(submission_id: result['id']).first_or_create(
        submission_id: result['id'],
        form: result['form'],
        lead: result['lead'],
        results: result['results'],
        date_submitted: result['dateSubmitted']
      )
    end
  end

  private

  def url
    "#{ENV['MAUTIC_URL']}api/forms/#{@form_id}"
  end

  def access_token
    user.access_token
  end

  def connection
    @connection ||= Faraday.new(url, params: params) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
      faraday.headers['Authorization'] = "Bearer #{access_token}"
    end
  end

  def params
    {
      limit: Mautic::ENTITY_LIMIT
    }
  end

  def user
    User.first
  end
end
