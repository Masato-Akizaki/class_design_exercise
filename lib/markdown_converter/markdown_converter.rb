class Markdown_Converter

  def convert_header(text)
    if text.start_with? "#"
      hashes, text = text.split(" ", 2)
      "<h#{hashes.length}>#{convert_strong(text)}</h#{hashes.length}>"
    elsif text.start_with? "-"
      _, text = text.split(" ", 2)
      "<li>#{convert_strong(text)}</li>"
    else
      "<p>" + convert_strong(text) + "</p>"
    end
  end

  def convert_strong(text)
    text.gsub("**").each_with_index { |_, i| "<#{"/" if i.odd?}strong>" }
  end
end