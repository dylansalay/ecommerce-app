# frozen_string_literal: true

require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  describe 'index' do
    before do
      visit inventory_items_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end
  end
end
