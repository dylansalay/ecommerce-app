require 'rails_helper'

RSpec.describe InventoryItem, type: :model do
  describe "Creation" do
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
		
		it 'sets default values for main_image and thumb_image' do
			@inventory_item.main_image = nil 
      @inventory_item.thumb_image = nil 
      @inventory_item.reload
			expect(@inventory_item.main_image).to eq(Placeholder.image_generator(height: '600', width: '400'))
			expect(@inventory_item.thumb_image).to eq(Placeholder.image_generator(height: '350', width: '200'))
		end
  end
end