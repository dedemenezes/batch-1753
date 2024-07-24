require_relative 'slot_machine'
# slot_machine = SlotMachine.new(['joker', 'joker', 'joker'])

slot_machine = SlotMachine.new
p slot_machine
p slot_machine.play
p slot_machine.score

puts "Your reels: #{slot_machine.play}. You made #{slot_machine.score} points"
