require_relative "../citizen"

describe Citizen do
  describe '#can_vote?' do
    it 'returns true if the citizen is 16 years old or more' do
      citizen = Citizen.new('', '', 16)
      expect(citizen.can_vote?).to eq(true)
    end
    it 'returns false if the citizen is younger than 16 yrs old' do
      citizen = Citizen.new('', '', 15)
      expect(citizen.can_vote?).to eq(false)
    end
  end

  describe '#full_name' do
    it 'returns the full name w\ the right letter case' do
      citizen = Citizen.new('dIaNa', 'saDDi', 25)
      expect(citizen.full_name).to eq('Diana Saddi')
    end
  end
end
