require 'sequel'

class TwitterDatasource
  def self.store_to_backlog(file_path)
    database_connection = Sequel.connect('postgres://orm:password@localhost/lead_gen_test')

    dataset = database_connection[:post_backlogs]

    #dataset.insert(tweet_text: "This is a salsa test", screen_name: "some_screen_name", location: "New York" )



  end
end