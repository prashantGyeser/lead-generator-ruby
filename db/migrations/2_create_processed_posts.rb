# sequel -m 2 db/migrations postgres://orm:password@localhost/lead_gen_test

Sequel.migration do
  up do
    create_table(:processed_posts) do
      primary_key :id
      Text :tweet_text
      String :screen_name, :null=>false
      String :location
    end
  end

  down do
    drop_table(:processes_posts)
  end
end