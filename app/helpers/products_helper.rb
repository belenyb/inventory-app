module ProductsHelper
  def get_title_emoji(title)
    title = title.downcase
    emoji = ""
    case title
      when "alimentos"
        emoji = "🍖"
      when "autos"
        emoji = "🚗"
      when "juegos"
        emoji = "🧩"
      when "ropa"
        emoji = "👕"
      when "tech"
        emoji = "📱"
      else
        emoji = "📦"
    end
    return emoji
  end
end
