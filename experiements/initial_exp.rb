require 'treat'
include Treat::Core::DSL

tweet = sentence("I can make the stars dance").tokenize

# Add chunk to this set in case the input is a para
# The segment function splits the sentence into meaningful units
# Tokenize breaks the sentence into tokens for processing
#tokenized_tweet = tweet.apply(:tokenize)

tweet.each do |token|
  puts token.to_s + ' ' + (token.category :stanford)
end

#puts 'danced'.tag :stanford

#puts tweet.words.select { |word| word.category :stanford == noun}
