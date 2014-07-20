$:.unshift File.dirname(__FILE__)

require 'reclassifier'
require 'lib/location_checker'
require 'lib/keyword_checker'
require 'lib/url_checker'
require 'csv'

csv_file_path = '../lead-generator-sample-data/mongo_tweets_for_dance.csv'
leads_csv_output_file_path = '../lead-generator-sample-data/lsi_classification_results_leads.csv'
non_leads_csv_output_file_path = '../lead-generator-sample-data/lsi_classification_results_nonleads_lsi.csv'
lead_tweet_list_path = "/home/prashant/Documents/lead-generator-sample-data/training-data/positive_input_for_classifier.csv"
nonlead_tweet_list_path = "/home/prashant/Documents/lead-generator-sample-data/training-data/negative_input_for_classifier.csv"

latent_semantic_index = Reclassifier::LSI.new
puts "LSI initialized"
########################################################################
# Training the bayesian classifier#
########################################################################
training_data_array = []
CSV.foreach(lead_tweet_list_path) do |row|
  tweet = row[1]
  training_array_item_lead = [tweet, :lead]
  training_data_array << training_array_item_lead
end

CSV.foreach(nonlead_tweet_list_path) do |row|
  tweet = row[1]
  training_array_item_nonlead = [tweet, :nonlead]
  training_data_array << training_array_item_nonlead
end
puts "Starting training..."
#training_data_array.each { |x| latent_semantic_index.add_item x.first, x.last}
count = 1
training_data_array.each do |item|
  puts count
  latent_semantic_index.add_item item.first, item.last
  count = count + 1
end

########################################################################
# Running the LSI on all the current tweets #
########################################################################
puts "Detecting uncategorized tweets..."
CSV.foreach(csv_file_path) do |row|
  tweet_text = row[0]
  tweet_location = row[1]
  tweet_screen_name = row[2]

  if UrlChecker.does_not_contains_url?(tweet_text)
    if LocationChecker.preferred_location_available?(tweet_location)
      if KeywordChecker.tweet_contains_homonymn?(tweet_text)
      else
        puts "Detecting for 1 tweet..."
        if latent_semantic_index.classify tweet_text == :lead
          CSV.open(leads_csv_output_file_path, 'a+') do |csv_lsi_leads|
            csv_lsi_leads << [tweet_text, tweet_screen_name, tweet_location]
          end
        else
          CSV.open(non_leads_csv_output_file_path, 'a+') do |csv_lsi_nonleads|
            csv_lsi_nonleads << [tweet_text, tweet_screen_name, tweet_location]
          end
        end
      end
    end
  end

end
