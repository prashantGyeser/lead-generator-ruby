$:.unshift File.dirname(__FILE__)

require 'lib/location_checker'
require 'lib/keyword_checker'
require 'lib/url_checker'
require 'csv'
require 'stuff-classifier'

csv_file_path = '../lead-generator-sample-data/mongo_tweets_for_dance.csv'
leads_csv_output_file_path = '../lead-generator-sample-data/bayesian_classification_results_leads.csv'
non_leads_csv_output_file_path = '../lead-generator-sample-data/bayesian_classification_results_nonleads.csv'
salsa_leads = '../lead-generator-sample-data/salsa_leads.csv'
salsa_non_leads = '../lead-generator-sample-data/salsa_nonleads.csv'
lead_tweet_list_path = "/home/prashant/Documents/lead-generator-sample-data/training-data/positive_input_for_classifier.csv"
nonlead_tweet_list_path = "/home/prashant/Documents/lead-generator-sample-data/training-data/negative_input_for_classifier.csv"

bayes_classifier = StuffClassifier::Bayes.new("Leads or Nonleads")

########################################################################
# Training the bayesian classifier#
########################################################################
CSV.foreach(lead_tweet_list_path) do |row|
  tweet = row[1]
  bayes_classifier.train(:lead, tweet)
end

CSV.foreach(nonlead_tweet_list_path) do |row|
  tweet = row[1]
  bayes_classifier.train(:nonlead, tweet)
end
########################################################################
# Running the bayesian classifier on all the current tweets #
########################################################################
CSV.foreach(csv_file_path) do |row|
  tweet_text = row[0]
  tweet_location = row[1]
  tweet_screen_name = row[2]

  if UrlChecker.does_not_contains_url?(tweet_text)
    if LocationChecker.preferred_location_available?(tweet_location)
      if KeywordChecker.tweet_contains_homonymn?(tweet_text)
        # Processing tweets that have salsa in it
        matches = KeywordChecker.find_keywords_in_tweet(tweet_text)
        if matches.count >= 2
          CSV.open(salsa_leads, 'a+') do |csv_salsa_leads|
            csv_salsa_leads << [tweet_text, tweet_location, tweet_screen_name]
          end
        else
          CSV.open(salsa_non_leads, 'a+') do |csv_salsa_nonleads|
            csv_salsa_nonleads << [tweet_text, tweet_location, tweet_screen_name]
          end
        end
      else
        if bayes_classifier.classify(tweet_text) == :lead
          CSV.open(leads_csv_output_file_path, 'a+') do |csv_bayesian_leads|
            csv_bayesian_leads << [tweet_text, tweet_screen_name, tweet_location]
          end
        else
          CSV.open(non_leads_csv_output_file_path, 'a+') do |csv_bayesian_nonleads|
            csv_bayesian_nonleads << [tweet_text, tweet_screen_name, tweet_location]
          end
        end
      end
    end
  end

end
