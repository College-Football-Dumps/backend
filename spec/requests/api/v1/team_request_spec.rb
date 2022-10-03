require 'rails_helper'

RSpec.describe 'Team Data' do
  it 'returns team advanced stats information', :vcr do
    get '/api/v1/teams', headers: headers, params: { year: "2021" }

    # require 'pry'; binding.pry 
    expect(response).to be_successful
    expect(response.status).to eq(200)


  end
end