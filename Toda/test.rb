require 'ruby2d'

file = File.open("text.txt")
file_data = file.read
Text.new(file_data)
home_page = 1
set width: 394
set height: 623
text = file_data

File.open("text.txt", "w")

on :key_down do |event|
    if event.key == "return"
        file = File.open("text.txt")
        file_data = file.read
        Text.new(file_data) 
    elsif  event.key == "backspace"
        file_data.delete![-1]  
    else
       text = text + event.key
       File.write("text.txt", text)
    end
  end

show



