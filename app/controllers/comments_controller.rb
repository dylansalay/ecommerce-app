class CommentsController < ApplicationController
  before_action :set_inventory_item, only: %i[ new create ]

  def new
    @comment = @inventory_item.comments.new
  end

  def create
    @comment = @inventory_item.comments.new(comment_params)
    @comment.user = current_or_guest_user
    @comment.save
    binding.pry

    respond_to do |format|
      format.html { redirect_to @inventory_item }
    end
  end

  private
    def set_inventory_item
      @inventory_item = InventoryItem.find_by(slug: params[:inventory_item_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end