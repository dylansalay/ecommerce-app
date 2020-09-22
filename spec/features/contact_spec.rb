# frozen_string_literal: true

require 'rails_helper'

describe 'navigate' do
  describe 'contactpage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end
