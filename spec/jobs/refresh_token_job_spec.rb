require 'rails_helper'

describe RefreshTokenJob do
  describe '#perform_later' do
    let(:user) { create :user }

    it 'enqueues job' do
      ActiveJob::Base.queue_adapter = :test

      expect { RefreshTokenJob.perform_later user: user }.to have_enqueued_job
    end
  end
end
