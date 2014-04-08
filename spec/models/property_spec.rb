require 'spec_helper'

describe Property do
  it {should validate_presence_of(:street_address)}
  it {should validate_presence_of(:city)}
  it {should validate_presence_of(:state)}
  it {should ensure_inclusion_of(:state).in_array(Property::STATES)}
  it {should validate_presence_of(:zip_code)}
  it {should have_valid(:state).when('MA', 'CT', 'KY')}
  it {should_not have_valid(:state).when('New York City', 'Mr. G')}
  it {should have_valid(:zip_code).when('02134', '01234-1234')}
  it {should_not have_valid(:zip_code).when('022', 'abc', '666666')}
end
