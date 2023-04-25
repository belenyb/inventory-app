class InventoryController < ApplicationController

  def initialize
    super
    @backend_service = BackendService.new
  end

  def index
    @items = @backend_service.get_items()
  end

end
