require_relative '../slot_machine'

RSpec.describe SlotMachine do
  describe "#score" do
    it "returns 0 for three different symbols" do
      slot_machine = SlotMachine.new([ "joker", "star", "bell" ])
      score = slot_machine.score
      expect(score).to eq(0)
    end

    # TODO: Implement all the rule combinations.
    it 'returns 50 for joker/joker/joker' do
      slot_machine = SlotMachine.new(['joker', 'joker', 'joker'])
      expect(slot_machine.score).to eq(50)
    end

    it 'returns 40 for star/star/star' do
      slot_machine = SlotMachine.new(['star', 'star', 'star'])
      expect(slot_machine.score).to eq(40)
    end

    it 'returns 30 for bell/bell/bell' do
      slot_machine = SlotMachine.new(['bell', 'bell', 'bell'])
      expect(slot_machine.score).to eq(30)
    end

    it 'returns 20 for seven/seven/seven' do
      slot_machine = SlotMachine.new(['seven', 'seven', 'seven'])
      expect(slot_machine.score).to eq(20)
    end

    it 'returns 10 for cherry/cherry/cherry' do
      slot_machine = SlotMachine.new(['cherry', 'cherry', 'cherry'])
      expect(slot_machine.score).to eq(10)
    end

    it 'returns 25 for 2 joker + anything' do
      slot_machine = SlotMachine.new(['joker', 'joker', 'seven'])
      expect(slot_machine.score).to eq(25)
    end

    it 'returns 20 for 2 star + anything' do
      slot_machine = SlotMachine.new(['star', 'star', 'joker'])
      expect(slot_machine.score).to eq(20)
    end

    it 'returns 15 for 2 bell + anything' do
      slot_machine = SlotMachine.new(['bell', 'bell', 'joker'])
      expect(slot_machine.score).to eq(15)
    end

    it 'returns 10 for 2 seven + anything' do
      slot_machine = SlotMachine.new(['seven', 'seven', 'joker'])
      expect(slot_machine.score).to eq(10)
    end

    it 'returns 5 for 2 cherry + anything' do
      slot_machine = SlotMachine.new(['cherry', 'cherry', 'joker'])
      expect(slot_machine.score).to eq(5)
    end
  end
end
