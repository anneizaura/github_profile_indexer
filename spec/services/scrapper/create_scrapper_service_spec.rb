# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Scrapper::CreateScrapperService, :vcr do
  describe '#get_from_url' do
    context 'when name and url params are present' do
      it 'returns the scraped data' do
        user = create(:user)
        response = described_class.new.get_from_url(user.url)

        expect(response['name']).to eq("Yukihiro \"Matz\" Matsumoto")
        expect(response['img']).to eq("https://avatars.githubusercontent.com/u/30733?v=4")
        expect(response['nick_name']).to eq('matz')
        expect(response['followers']).to eq('9k')
        expect(response['following']).to eq('1')
        expect(response['stars']).to eq('13')
        expect(response['contributions']).to eq('885')
        expect(response['organization']).to eq('Ruby Association,NaCl')
        expect(response['location']).to eq('Matsue, Japan')
      end
    end
  end
end
