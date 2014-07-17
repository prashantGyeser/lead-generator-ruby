Sequel.migration do
  up do
    create_table(:post_backlogs) do
      primary_key :id
      Text :tweet_text
      String :screen_name, :null=>false
      String :location
    end
  end

  down do
    drop_table(:post_backlogs)
  end
end