require 'lib/url_checker'

RSpec.describe UrlChecker do

  it "should return true if there is a url in a give string" do
    expect(UrlChecker.does_not_contains_url?("This is a test with a url http://urbanzeak.com")).to be false
  end

  it "should return false if there are no urls" do
    expect(UrlChecker.does_not_contains_url?("This is a test with a url")).to be true
  end

  it "should return true when there is only a colon in the string" do
    # Todo: Change this module so that words ending with a colon are not taken into account
    #expect(UrlChecker.does_not_contains_url?("This is a test with a url:")).to be true
  end
end