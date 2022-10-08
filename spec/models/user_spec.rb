require 'rails_helper'

RSpec.describe 'User Model' do
   describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
   end
end
  
