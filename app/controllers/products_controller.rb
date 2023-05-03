class ProductsController < ApplicationController
  def initialize
    super
    @backend_service = BackendService.new
  end

  def index
    items = @backend_service.get_items()
    @items_by_category = items.group_by { |item| item["category"] }
  end

  def new
    items = @backend_service.get_items()
    @items_by_category = items.group_by { |item| item["category"] }
  end

  def create
    @item = Item.new(product_params)
    if @item.valid?
      @resp = @backend_service.create_item(@item)
      if @resp.code == 201
        redirect_to inventory_index_path, notice: "Producto cargado exitosamente"
      else
        redirect_to :new, notice: "Error al cargar el producto"
      end
    end
  end

  private

  def product_params
    params.require(:item).permit(:item_name, :description, :sku, :brand, :category, :quantity_on_hand, :sale_price_per_unit)
  end
end
