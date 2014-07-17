require '../spec/spec_helper'

RSpec.describe KeywordChecker do

  it "should do an exact match for a keyword" do
    expect(KeywordChecker.keyword_in_tweet?("salsa")).to eq(true)
  end

  it "should ignore case when checking a keyword" do
    expect(KeywordChecker.keyword_in_tweet?("Salsa")).to eq(true)
  end

  it "should not match a substring keyword" do
    expect(KeywordChecker.keyword_in_tweet?("salsathis is")).to eq(true)
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

end
