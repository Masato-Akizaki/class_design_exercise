class Markdown_Converter

  def convert_header(text)
    if text.start_with? "#"
      hashes, text = text.split(" ", 2)
      "<h#{hashes.length}>#{text}</h#{hashes.length}>"
    else
      "<p>" + text + "</p>"
    end
  end

  def convert_strong(text)
    text.gsub("**").each_with_index { |_, i| "<#{"/" if i.odd?}strong>" }
  end

end