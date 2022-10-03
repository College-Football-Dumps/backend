require 'rails_helper'

RSpec.describe 'Team Data' do
  it 'returns team advanced stats information, happy path', :vcr do
    get '/api/v1/teams', headers: headers, params: { year: "2021"  }

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
    expect(teams_defense[:data][:attributes].first[:name]).to eql('Air Force')
    expect(teams_defense[:data][:attributes].last[:name]).to eql('Wyoming')
  end

  it 'returns team advanced stats information, sad path', :vcr do
    get '/api/v1/teams', headers: headers, params: { year: ""  }

    expect(response.status).to eq(404)
    expect(response.body).to eq("Please enter a valid year between 2016-2022")
  end

  it 'returns team advanced stats information, sad path', :vcr do
    get '/api/v1/teams', headers: headers, params: { year: "2014"  }
    
    expect(response.status).to eq(404)
    expect(response.body).to eq("Please enter a valid year between 2016-2022")
  end
end