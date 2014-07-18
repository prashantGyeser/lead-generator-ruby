class KeywordChecker
  # The keywords to check are listed above, add all the keywords here.
  def self.find_keywords_in_tweet(tweet_text)
    keywords_to_find_meanings = ['salsa', 'bachata', 'merengue', 'dance', 'dances', 'dancing', 'danced','dancer', 'latin', 'cuban', 'groove', 'boogaloo', 'party', 'mambo', 'music','move', 'spanish', 'waltz']
    tweet_array = tweet_text.downcase.split(' ')
    matches = keywords_to_find_meanings & tweet_array
    return matches
  end

  def self.positive_operator_in_tweet?(tweet_text)
    positive_operators = ['like','love','want','learn','learned','learning','wanna','teach', 'need']
    positive_operators.any? { |w| tweet_text.downcase =~ /#{w}/ }
  end

  def self.tweet_contains_homonymn?(tweet_text)
    homonyms = ['salsa']
    homonyms.any? { |w| tweet_text.downcase =~ /#{w}/ }
  end
end

