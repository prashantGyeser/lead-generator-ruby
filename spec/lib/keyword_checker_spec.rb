require '../spec/spec_helper'

RSpec.describe KeywordChecker do
  it "should do an exact match for a keyword" do
    expect(KeywordChecker.keyword_in_tweet?("salsa")).to eq(true)
  end
end
