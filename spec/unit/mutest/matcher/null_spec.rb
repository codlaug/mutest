RSpec.describe Mutest::Matcher::Null, '#call' do
  let(:object) { described_class.new          }
  let(:env)    { instance_double(Mutest::Env) }

  subject { object.call(env) }

  it 'returns no subjects' do
    is_expected.to eql([])
  end
end
