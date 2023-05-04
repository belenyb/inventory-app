require 'rest-client'
require 'json'
require 'date'

class BackendService

  def initialize
    @baseUrl = "https://crudapi.co.uk/api/v1"
    @token = "H7jvD01d0WApuBdMIp7DBXLhKiKTlU-8F76J4vcsu1_z7-3M3A"
  end

  def get_items()
    items = []
    response = RestClient.get "#{@baseUrl}/item", {accept: :json, :Authorization => "Bearer #{@token}"}
    rows = JSON.parse(response.body)["items"]
    rows.each do |row|
      items << Item.new(row)
    end
    items
  end

  def create_item(item)
    item = item.attributes.compact
    item = [item];
    item = item.to_json;
    response = RestClient.post "#{@baseUrl}/item", item, {:accept => :json, content_type: :json, :Authorization => "Bearer #{@token}"}
    response
  end

  def get_item(item_id)
    response = RestClient.get "#{@baseUrl}/item/#{item_id}", {accept: :json, :Authorization => "Bearer #{@token}"}
    @item = Item.new(JSON.parse(response.body))
    @item
  end

  def update_item(item, item_id)
    response = RestClient.put "#{@baseUrl}/item/#{item_id}", item.to_json, {:accept => :json, content_type: :json, :Authorization => "Bearer #{@token}"}
  end

  def delete_item(item_id)
    response = RestClient.delete "#{@baseUrl}/item/#{item_id}", {accept: :json, :Authorization => "Bearer #{@token}"}
    response
  end
end
