require_relative 'lib/twitter_datasource'

file_path = '../lead-generator-sample-data/mongo_tweets_for_dance.csv'

TwitterDatasource.store_to_backlog(file_path)