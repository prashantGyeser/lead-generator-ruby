require 'sequel'
require 'csv'

class TwitterDatasource
  def self.store_to_backlog(csv_file_path)
    database_connection = Sequel.connect('postgres://orm:password@localhost/lead_gen_test')

    dataset = database_connection[:post_backlogs]

    #dataset.insert(tweet_text: "This is a salsa test", screen_name: "some_screen_name", location: "New York" )

    # Reading the csv file and storing the data into the backlog
    CSV.foreach(csv_file_path) do |row|
      tweet_text = row[0]#.downcase.gsub(/[^a-z0-9\s]/i, '')
      tweet_location = row[1]
      tweet_screen_name = row[2]

      dataset.insert(tweet_text: tweet_text, screen_name: tweet_screen_name, location: tweet_location )
    end


  end
end