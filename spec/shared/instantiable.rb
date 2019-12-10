shared_examples 'instantiable' do
  it 'is instantiable' do
    expect { described_class.new }.not_to raise_error
  end
end
