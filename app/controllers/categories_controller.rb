class CategoriesController < ApplicationController
    def initialize
      super
      @backend_service = BackendService.new
    end

    def index
      items = @backend_service.get_items()
      @items_by_category = items.group_by { |item| item["category"] }
    end

    def show
    end
end
