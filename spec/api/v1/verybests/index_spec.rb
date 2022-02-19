require "rails_helper"

RSpec.describe "verybests#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/verybests", params: params
  end

  describe "basic fetch" do
    let!(:verybest1) { create(:verybest) }
    let!(:verybest2) { create(:verybest) }

    it "works" do
      expect(VerybestResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["verybests"])
      expect(d.map(&:id)).to match_array([verybest1.id, verybest2.id])
    end
  end
end
