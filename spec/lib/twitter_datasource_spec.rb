require 'sequel'
require 'lib/twitter_datasource'

RSpec.describe TwitterDatasource do

  it "should read a csv file" do
    TwitterDatasource.store_to_backlog('../fixtures/tweets_to_import_test.csv')
    database_connection = Sequel.connect('postgres://orm:password@localhost/lead_gen_test')
    dataset = database_connection[:post_backlogs]
    result_set = dataset.where(screen_name: "something_something"  )
    p result_set
    expect(result_set).to eq("test")


  end

end