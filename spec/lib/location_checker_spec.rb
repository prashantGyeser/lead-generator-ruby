require '../spec/spec_helper'

RSpec.describe LocationChecker do

  it "should do an exact match for a location" do
    expect(LocationChecker.preferred_location_check(["queens"], "queens")).to be(true)
  end

  it "should ignore case when doing a match" do
    expect(LocationChecker.preferred_location_check(["queens"], "Queens")).to be(true)
  end

  it "should match a substring" do
    expect(LocationChecker.preferred_location_check(["queens"], "Queens new york")).to be(true)
  end
end