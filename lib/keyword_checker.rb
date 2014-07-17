positive_operators = ['like','love','want','learn','learned','learning','wanna','teach']
homonyms = ['salsa']

class KeywordChecker

  # The keywords to check are listed above, add all the keywords here.
  def self.keyword_in_tweet?(tweet_text)
    keywords_to_find_meanings = ['salsa', 'bachata', 'merengue', 'dance', 'dances', 'dancing', 'danced','dancer', 'latin', 'cuban', 'groove', 'boogaloo', 'party', 'mambo', 'music','move', 'spanish', 'waltz']
    # Refer http://stackoverflow.com/a/5482903
    keywords_to_find_meanings.any? { |w| tweet_text.downcase =~ /#{w}/ }
  end

  def self.positive_operator_in_tweet?(tweet_text)
    positive_operators = ['like','love','want','learn','learned','learning','wanna','teach']
    positive_operators.any? { |w| tweet_text.downcase =~ /#{w}/ }
  end
end

