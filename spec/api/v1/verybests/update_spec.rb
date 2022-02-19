require "rails_helper"

RSpec.describe "verybests#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/verybests/#{verybest.id}", payload
  end

  describe "basic update" do
    let!(:verybest) { create(:verybest) }

    let(:payload) do
      {
        data: {
          id: verybest.id.to_s,
          type: "verybests",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(VerybestResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { verybest.reload.attributes }
    end
  end
end
