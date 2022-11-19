# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shortener::CreateShortenerService, :vcr do
  describe '#short_link' do
    context 'when name and url params are present' do
      it 'returns the short url data' do
        user = create(:user)
        response = described_class.new.short_link(user.url)

        expect(response).to eq("https://bit.ly/3V0uvFX")
      end
    end
  end
end
