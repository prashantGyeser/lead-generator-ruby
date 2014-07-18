require 'sequel'
require 'pp'
require 'lib/twitter_datasource'

RSpec.describe TwitterDatasource do

  it "should read a csv file" do
    TwitterDatasource.store_to_backlog('spec/fixtures/tweets_to_import_test.csv')

      database_connection = Sequel.connect('postgres://orm:password@localhost/lead_gen_test')
    dataset = database_connection[:post_backlogs]
    result_set = dataset.first

    expect(result_set[:screen_name]).to eq('something_something')


  end

end