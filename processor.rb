$:.unshift File.dirname(__FILE__)

require 'lib/location_checker'
require 'lib/keyword_checker'
require 'lib/url_checker'
require 'csv'

csv_file_path = '../lead-generator-sample-data/mongo_tweets_for_dance.csv'
csv_output_file_path = '../lead-generator-sample-data/results_no_cities.csv'
csv_classifier_negative_file_path = '../lead-generator-sample-data/negative_results.csv'

CSV.foreach(csv_file_path) do |row|
  tweet_text = row[0]
  tweet_location = row[1]
  tweet_screen_name = row[2]

  if UrlChecker.does_not_contains_url?(tweet_text)
    if KeywordChecker.tweet_contains_homonymn?(tweet_text)
      # Processing tweets that have salsa in it
      matches = KeywordChecker.find_keywords_in_tweet(tweet_text)
      if matches.count >= 2
        CSV.open(csv_output_file_path, 'a+') do |csv|
          csv << [tweet_text, tweet_location, tweet_screen_name]
        end
      else
        CSV.open(csv_classifier_negative_file_path, 'a+') do |csv|
          csv << [tweet_text, tweet_location, tweet_screen_name]
        end
      end
    else
      if KeywordChecker.positive_operator_in_tweet?(tweet_text)
        CSV.open(csv_output_file_path, 'a+') do |csv|
          csv << [tweet_text, tweet_location, tweet_screen_name]
        end
      else
        CSV.open(csv_classifier_negative_file_path, 'a+') do |csv|
          csv << [tweet_text, tweet_location, tweet_screen_name]
        end
      end
    end
  end

end
