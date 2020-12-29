class Markdown_Converter

  def convert(text)
    array = text.split(" ", 2)
    if array[0] == '#'
      output = "<h1>" + array[1] + "</h1>"
    elsif array[0] == '##'
      output = "<h2>" + array[1] + "</h2>"
    elsif array[0] == '###'
      output = "<h3>" + array[1] + "</h3>"
    elsif array[0] == '####'
      output = "<h4>" + array[1] + "</h4>"
    elsif array[0] == '#####'
      output = "<h5>" + array[1] + "</h5>"
    elsif array[0] == '######'
      output = "<h6>" + array[1] + "</h6>"
    else
      output = "<p>" + text + "</p>"
    end
  end

end