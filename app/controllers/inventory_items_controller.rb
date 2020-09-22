# frozen_string_literal: true

class InventoryItemsController < ApplicationController
  before_action :set_inventory_item, only: %i[show edit update destroy]
  layout 'inventory_item'

  def index
    @inventory_items = InventoryItem.all
    @page_title = 'Inventory Items'
  end

  def show
    @page_title = @inventory_item.title
    @seo_keywords = @inventory_item.title
  end

  def new
    @inventory_item = InventoryItem.new
  end

  def edit; end

  def create
    @inventory_item = InventoryItem.new(inventory_item_params)

    respond_to do |format|
      if @inventory_item.save
        format.html { redirect_to @inventory_item, notice: 'Inventory item was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_item }
      else
        format.html { render :new }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @inventory_item.update(inventory_item_params)
        format.html { redirect_to @inventory_item, notice: 'Inventory item was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_item }
      else
        format.html { render :edit }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inventory_item.destroy
    respond_to do |format|
      format.html { redirect_to inventory_items_url, notice: 'Inventory item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_inventory_item
    @inventory_item = InventoryItem.friendly.find(params[:id])
  end

  def inventory_item_params
    params.require(:inventory_item).permit(:title, :subtitle, :body, :unit_cost, :main_image, :thumb_image)
  end
end
