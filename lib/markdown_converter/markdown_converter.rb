class Markdown_Converter

  def convert(text)
    array = text.split(" ", 2)
    if array[0] == '#'
      "<h1>" + array[1] + "</h1>"
    elsif array[0] == '##'
      "<h2>" + array[1] + "</h2>"
    elsif array[0] == '###'
      "<h3>" + array[1] + "</h3>"
    elsif array[0] == '####'
      "<h4>" + array[1] + "</h4>"
    elsif array[0] == '#####'
      "<h5>" + array[1] + "</h5>"
    elsif array[0] == '######'
      "<h6>" + array[1] + "</h6>"
    else
      "<p>" + text + "</p>"
    end
  end

  def convert_strong(text)
    text.gsub("**").each_with_index { |_, i| "<#{"/" if i.odd?}strong>" }
  end

end