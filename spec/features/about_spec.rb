require 'rails_helper'

describe 'navigate' do
  describe 'aboutpage' do
    it 'can be reached successfully' do
      visit about_path
      expect(page.status_code).to eq(200)
    end
  end
end