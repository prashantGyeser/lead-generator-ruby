require 'lib/keyword_checker'

RSpec.describe KeywordChecker do

  it "should do an exact match for a keyword" do
    expect(KeywordChecker.find_keywords_in_tweet("salsa")).to eq(["salsa"])
  end

  it "should ignore case when checking a keyword" do
    expect(KeywordChecker.find_keywords_in_tweet("I love Salsa")).to eq(["salsa"])
  end

  it "should not match a substring keyword" do
    expect(KeywordChecker.find_keywords_in_tweet("salsathis is")).to eq([])
  end

  it "should return all the keywords matched" do
    expect(KeywordChecker.find_keywords_in_tweet("I love salsa dance")).to eq(["salsa","dance"])
  end

  it "should do an exact match for a positive operator" do
    expect(KeywordChecker.positive_operator_in_tweet?("like")).to eq(true)
  end

  it "should ignore case when checking a positive operator" do
    expect(KeywordChecker.positive_operator_in_tweet?("Like")).to eq(true)
  end

  it "should not match a substring for a positive operator" do
    expect(KeywordChecker.positive_operator_in_tweet?("likethis is")).to eq(true)
  end

  it "should return true if the tweet contains a homonymn" do
    expect(KeywordChecker.tweet_contains_homonymn?("I love salsa")).to eq(true)
  end

  it "should return true if the tweet contains a homonymn and is uppercase" do
    expect(KeywordChecker.tweet_contains_homonymn?("I love SALSA")).to eq(true)
  end

end
