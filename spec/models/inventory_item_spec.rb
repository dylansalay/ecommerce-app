# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InventoryItem, type: :model do
  describe 'Creation' do
    before do
      @inventory_item = FactoryBot.create(:inventory_item)
    end

    it 'can be created' do
      expect(@inventory_item).to be_valid
    end

    it 'cannot be created without a title or body' do
      @inventory_item.title = nil
      @inventory_item.body = nil
      expect(@inventory_item).to_not be_valid
    end
  end
end
