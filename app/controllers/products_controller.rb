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

  def edit
    @item = @backend_service.get_item(params[:id])
    items = @backend_service.get_items()
    @items_by_category = items.group_by { |item| item["category"] }
  end

  def update
    @item = @backend_service.get_item(params[:id])
    @item.item_name = params[:item][:item_name] unless params[:item][:item_name] == ""
    @item.description = params[:item][:description] unless params[:item][:description] == ""
    @item.brand = params[:item][:brand] unless params[:item][:brand] == ""
    @item.sku = params[:item][:sku] unless params[:item][:sku] == ""
    @item.category = params[:item][:category] unless params[:item][:category] == ""
    @item.quantity_on_hand = params[:item][:quantity_on_hand] unless params[:item][:quantity_on_hand] == ""
    @item.sale_price_per_unit = params[:item][:sale_price_per_unit] unless params[:item][:sale_price_per_unit] == ""

    @resp = @backend_service.update_item(@item, params[:id])
    if @resp.code == 200
      redirect_to products_path, notice: "Producto editado exitosamente"
    else
      redirect_to :edit, notice: "Error al cargar el producto"
    end
  end

  def destroy
    p "+++++++++++++++++++++"
    p "destroy method"
    @resp = @backend_service.delete_item(params[:id])
    if @resp.code == 200
      redirect_to products_path, notice: "Producto eliminado exitosamente"
    else
      redirect_to products_path, notice: "Error al eliminar el producto"
    end
  end

  private

  def product_params
    params.require(:item).permit(:item_name, :description, :sku, :brand, :category, :quantity_on_hand, :sale_price_per_unit)
  end
end
