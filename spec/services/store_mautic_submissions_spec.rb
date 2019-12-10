describe StoreMauticSubmissions do
  let(:form_id) { 1 }
  let(:mautic_service) { StoreMauticSubmissions.new form_id: form_id }

  describe '#initialize' do
    it 'instantiates object' do
      expect(mautic_service).to be_an_instance_of(StoreMauticSubmissions)
    end
  end
end
