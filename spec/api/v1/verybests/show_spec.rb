require 'rails_helper'

RSpec.describe "verybests#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/verybests/#{verybest.id}", params: params
  end

  describe 'basic fetch' do
    let!(:verybest) { create(:verybest) }

    it 'works' do
      expect(VerybestResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('verybests')
      expect(d.id).to eq(verybest.id)
    end
  end
end
