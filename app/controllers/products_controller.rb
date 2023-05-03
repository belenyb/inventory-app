class ProductsController < ApplicationController
  def initialize
    super
    @backend_service = BackendService.new
  end

  def index
    @items = @backend_service.get_items()
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
        redirect_to products_path, notice: "Producto cargado exitosamente"
      else
        redirect_to :new, notice: "Error al cargar el producto"
      end
    end
  end

  def show
    @item = @backend_service.get_item(params[:id])
  end

  def update
  end

  def destroy
    p "destroy method"
    @item = Item.find(params[:_uuid])
  end

  private

  def product_params
    params.require(:item).permit(:item_name, :description, :sku, :brand, :category, :quantity_on_hand, :sale_price_per_unit)
  end
end
