def acronymize(sentence)
  # 1. split the sentence into an array of words
  phrase = sentence.split(' ')
  # p phrase
  # 2. Iterate over the array
  characters = phrase.map do |word|
    # 3. get the first letter FOR EACH ONE OF THE WORDS IN THE ARRAY
    word[0]
  end
  # 4. Join the letter into a string
  p characters.join.upcase
  # 5. return the string
end
