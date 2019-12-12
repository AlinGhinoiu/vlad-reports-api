class StoreMauticSubmissionsJob < ApplicationJob
  queue_as :default

  retry_on MauticErrors::TokenExpiredError

  def perform form_id:
    StoreMauticSubmissions.new(form_id: form_id).call
  end
end
