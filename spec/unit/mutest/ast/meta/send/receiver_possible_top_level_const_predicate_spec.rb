RSpec.describe Mutest::AST::Meta::Send, '#receiver_possible_top_level_const?' do
  subject { described_class.new(node).receiver_possible_top_level_const? }

  def parse(source)
    Unparser.parse(source)
  end

  context 'when implicit top level const' do
    let(:node) { parse('Foo.bar') }

    it { is_expected.to be true }
  end

  context 'when cbase' do
    let(:node) { parse('::Foo.bar') }

    it { is_expected.to be true }
  end

  context 'when nested const' do
    let(:node) { parse('Baz::Foo.bar') }

    it { is_expected.to be false }
  end

  context 'when no receiver' do
    let(:node) { parse('bar') }

    it { is_expected.to be false }
  end

  context 'when send receiver' do
    let(:node) { parse('foo.bar') }

    it { is_expected.to be false }
  end
end
