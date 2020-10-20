require 'rails_helper'

RSpec.describe Website, type: :model do
  context 'validation tests' do
    it 'ensures the url is present' do
      website = Website.new(url: 'https://www.example.com', visits: 0).save
      expect(website).to eq(true)
    end

    it 'ensures the url (https://www.example.com) is valid' do
      website = Website.new(url: 'https://www.example.com', visits: 0)
      expect(website.valid?).to eq(true)
    end

    it 'ensures the url (http://www.example.com) is valid' do
      website = Website.new(url: 'http://www.example.com', visits: 0)
      expect(website.valid?).to eq(true)
    end

    it 'ensures the url (https://example.com) is valid' do
      website = Website.new(url: 'https://example.com', visits: 0)
      expect(website.valid?).to eq(true)
    end

    it 'ensures the url (https://example) is not valid' do
      website = Website.new(url: 'https://example', visits: 0)
      expect(website.valid?).to eq(false)
    end

    it 'ensures the url (https:example) is not valid' do
      website = Website.new(url: 'https:example', visits: 0)
      expect(website.valid?).to eq(false)
    end

    it 'ensures the url (www.example) is not valid' do
      website = Website.new(url: 'example.com', visits: 0)
      expect(website.valid?).to eq(false)
    end

    it 'ensures the url (www.example.com) is not valid' do
      website = Website.new(url: 'www.example.com', visits: 0)
      expect(website.valid?).to eq(false)
    end

    it 'ensures the url (example.com) is not valid' do
      website = Website.new(url: 'example.com', visits: 0)
      expect(website.valid?).to eq(false)
    end

    it 'ensures the url (example) is not valid' do
      website = Website.new(url: 'example', visits: 0)
      expect(website.valid?).to eq(false)
    end

  end

  context 'scope tests' do

  end
end
