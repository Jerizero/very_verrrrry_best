require "rails_helper"

RSpec.describe VerybestResource, type: :resource do
  describe "serialization" do
    let!(:verybest) { create(:verybest) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(verybest.id)
      expect(data.jsonapi_type).to eq("verybests")
    end
  end

  describe "filtering" do
    let!(:verybest1) { create(:verybest) }
    let!(:verybest2) { create(:verybest) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: verybest2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([verybest2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:verybest1) { create(:verybest) }
      let!(:verybest2) { create(:verybest) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      verybest1.id,
                                      verybest2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      verybest2.id,
                                      verybest1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
