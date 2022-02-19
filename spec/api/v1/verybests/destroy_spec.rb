require 'rails_helper'

RSpec.describe "verybests#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/verybests/#{verybest.id}"
  end

  describe 'basic destroy' do
    let!(:verybest) { create(:verybest) }

    it 'updates the resource' do
      expect(VerybestResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Verybest.count }.by(-1)
      expect { verybest.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
