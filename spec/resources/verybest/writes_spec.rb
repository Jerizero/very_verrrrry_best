require 'rails_helper'

RSpec.describe VerybestResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'verybests',
          attributes: { }
        }
      }
    end

    let(:instance) do
      VerybestResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Verybest.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:verybest) { create(:verybest) }

    let(:payload) do
      {
        data: {
          id: verybest.id.to_s,
          type: 'verybests',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      VerybestResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { verybest.reload.updated_at }
      # .and change { verybest.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:verybest) { create(:verybest) }

    let(:instance) do
      VerybestResource.find(id: verybest.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Verybest.count }.by(-1)
    end
  end
end
