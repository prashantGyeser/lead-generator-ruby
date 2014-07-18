require 'lib/location_checker'

RSpec.describe LocationChecker do

  it "should do an exact match for a location" do
    expect(LocationChecker.preferred_location_available?("queens")).to be(true)
  end

  it "should ignore case when doing a match" do
    expect(LocationChecker.preferred_location_available?("Queens")).to be(true)
  end

  it "should match a substring" do
    expect(LocationChecker.preferred_location_available?("Queens new york")).to be(true)
  end

  it "should not error out if the location is nil" do
    expect(LocationChecker.preferred_location_available?(nil)).to be(false)
  end
end