require_relative '../acronymize'

RSpec.describe '#acronymize' do
  it 'returns the right acronym for laughing out loud' do
    expect(acronymize('laughing out loud')).to eq('LOL')
  end

  it 'returns the right acronym for too long didnt read' do
    expect(acronymize('Too Long Didnt Read')).to eq('TLDR')
  end

  it 'returns the right acronym for working from home' do
    actual = acronymize('work from home')
    expected = 'WFH'
    expect(actual).to eq(expected)
  end
end
