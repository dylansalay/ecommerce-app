# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Creation' do
    before do
      @category = FactoryBot.create(:category)
    end

    it 'can be created' do
      expect(@category).to be_valid
    end

    it 'cannot be created without a title' do
      @category.title = nil
      expect(@inventory_item).to_not be_valid
    end
  end
end
