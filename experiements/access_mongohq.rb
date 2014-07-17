require 'csv'

file_to_read = '../lead-generator-sample-data/mongo_tweets_for_dance.csv'
results_file = '../lead-generator-sample-data/processed.csv'

# These are the words that are used to see if salsa is the food item or
# the dance
keywords_to_find_meanings = ['salsa', 'bachata', 'merengue', 'dance', 'dances', 'dancing', 'danced','dancer', 'latin', 'cuban', 'groove', 'boogaloo', 'party', 'mambo', 'music','move', 'spanish', 'waltz']
positive_operators = ['like','love','want','learn','learned','learning','wanna','teach']
homonyms = ['salsa']

locations_to_find_tweets_in = ['nyc', 'new york', 'manhattan', 'queens', 'long island', 'hoboken', 'brooklyn', 'jersey' ]


################### Delete This #########################
tweet_to_test = "does anyone know a pop/non-traditional song that you can dance salsa to? makin a playlist~~"
tweet_array = tweet_to_test.split(" ")
################### Delete This #########################

# Comparing words in one array with another and returning all the
# common words
def find_common_words_in_two_arrays(word_list, string_array_to_compare)
  return string_array_to_compare & word_list
end

# Todo: Change the include to substring
def location_check(preferred_locations_array, tweet_location_to_check)
  preferred_locations_array.each do |location|
    if tweet_location_to_check.include? location
      return true
    end
  end
  return false
end

def csv_writer(tweet_text_to_write, tweet_location_to_write, tweet_screen)

end

# Reading the csv file line by line
count = 1
row_count = 1
CSV.foreach(file_to_read) do |row|

  row_count = row_count + 1
  tweet_text = row[0].downcase.gsub(/[^a-z0-9\s]/i, '')
  tweet_location = row[1]
  tweet_screen_name = row[2]

  tweet_text_array = tweet_text.split(" ")
  if tweet_location.nil?
    location_in_locations_to_process = []
  else
    #location_in_locations_to_process = find_common_words_in_two_arrays(locations_to_find_tweets_in, tweet_location_array)

    if location_check(locations_to_find_tweets_in, tweet_location.downcase.gsub(/[^a-z0-9\s]/i, '')) == true

      homonymns_in_tweet = find_common_words_in_two_arrays(homonyms, tweet_text_array)

      if homonymns_in_tweet.size >= 1
        list_of_keywords_in_tweet = find_common_words_in_two_arrays(keywords_to_find_meanings, tweet_text_array)
        if list_of_keywords_in_tweet.size >= 2

          puts count
          count = count + 1

        end
      else

      end

    end
  end


end
puts "The row count is:", row_count