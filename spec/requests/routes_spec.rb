require 'rails_helper'

describe 'Application routes', type: :request  do
  it 'has a root route' do 
    get '/'
    expect(response).to have_http_status(:success)
  end
end