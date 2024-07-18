def encrypt(text)
  # 1. recognize all the letters (create an array of the alphabet)
  alphabet = ('A'..'Z').to_a
  # 2. trasnform the text into an array of LETTERS! ( split the text into an array of letters)
  text_chars = text.split('')
  # p text_chars
  # 3.0 ITERATE OVER THE TEXT LETTERS ARRAY
  encrypted_text = text_chars.map do |letter|
    # 3.1 replace EACH LETTER
    # 3.2. Identify the index of the text letter
    index = alphabet.index(letter)
    # 3.3 subtract three from the index if it's not an empty space (nil)
    if index != nil
      shift_index = index - 3
      # p shift_index
      # 3.4 READ the new letter from the alphabet
      # p letter
      alphabet[shift_index]
    else
      # This is to keep the space in the transformed array
      letter
    end
  end
  encrypted_text.join
end

puts encrypt("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG") == "QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD"
