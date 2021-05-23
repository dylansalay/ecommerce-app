# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_inventory_item
  before_action :set_comment, only: %i[destroy]

  def index
    @comments = @inventory_item.comments
  end

  def new
    @comment = @inventory_item.comments.new
  end

  def create
    @comment = @inventory_item.comments.create!(comment_params)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @inventory_item }
    end
  end

  def destroy
    if @comment.can_delete?(current_or_guest_user)
      @comment.destroy
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: 'Your comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: 'You do not have permission to remove this comment' }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_inventory_item
    @inventory_item = InventoryItem.find_by(slug: params[:inventory_item_id])
  end

  def set_comment
    @comment = @inventory_item.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_name, :rating)
  end
end
