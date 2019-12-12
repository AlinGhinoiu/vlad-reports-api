describe StoreMauticSubmissionsJob do
  describe '#perform_later' do
    let(:form_id) { 1 }

    it 'enqueues job' do
      ActiveJob::Base.queue_adapter = :test

      expect {
        StoreMauticSubmissionsJob.perform_later form_id: form_id
      }.to have_enqueued_job
    end
  end
end
