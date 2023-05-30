module PriceFormatterHelper
  def format_price(price)
    formatted_price = sprintf('%.2f', price) # Add two decimal places
    whole_part, decimal_part = formatted_price.split('.')
    whole_part.gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, '\\1.') # Add dot separator every three digits in the whole part
    formatted_price = "$#{whole_part},#{decimal_part}" # Add dollar sign and comma
  end
end
