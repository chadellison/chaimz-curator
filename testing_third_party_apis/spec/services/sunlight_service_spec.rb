require "rails_helper"

describe SunlightService do
  it 'returns a list of legislators filtered by "gender"', :vcr do
    service = SunlightService.new
    legislators = service.legislators(gender: "F")
    legislator = legislators.first

    expect(legislators.count).to eq 20
    expect(legislator[:first_name]).to eq "Joni"
    expect(legislator[:last_name]).to eq "Ernst"
  end
end
