require 'rails_helper'

RSpec.describe 'Team Data' do
  it 'returns team advanced stats information, total', :vcr do
    get '/api/v1/teams', headers: headers, params: { year: "2021"  }

    # require 'pry'; binding.pry 
    expect(response).to be_successful
    expect(response.status).to eq(200)
  end

  it 'returns team advanced stats information, defensive line', :vcr do
    get '/api/v1/teams', headers: headers, params: { year: "2021"  }

    # require 'pry'; binding.pry 
    expect(response).to be_successful
    expect(response.status).to eq(200)

    teams_defense = JSON.parse(response.body, symbolize_names: true)
    
    expect(teams_defense).to be_a(Hash)
    expect(teams_defense).to have_key(:data)
    expect(teams_defense[:data]).to be_a(Hash)
    expect(teams_defense[:data]).to have_key(:id)
    expect(teams_defense[:data][:id]).to eq(nil)
    expect(teams_defense[:data]).to have_key(:type)
    expect(teams_defense[:data][:type]).to eq('teams')
    expect(teams_defense[:data]).to have_key(:attributes)
    expect(teams_defense[:data][:attributes]).to be_a(Array)
  end
end