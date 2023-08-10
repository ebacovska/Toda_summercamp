require 'ruby2d'

set width: 1920
set height: 1080

done = 0


def mony_count
  file = File.open("mony.txt")
  mony = file.read
  Text.new(
    mony.to_s + " coins",
    x: 20, y: 30,
    style: 'bold',
    size: 40,
    color: '#F0D7BF'
  )

  coin = Sprite.new(
    'coin.png',
    x: 200, y: 10,
    clip_width: 84,
    time: 200,
    loop: false
    )
  
end


Image.new("1.png")
Image.new(
    "toda.png",
    x: 80, y: 250)

Image.new(
    "dots.png",
    x: 1760, y: 15,
    width: 120, height: 120)


mony_count()

number_of_page = 1
sleepnig = 0




on :mouse do |event|
    if event.type == :down
      if event.x > 200 && event.x < 280 && event.y > 15 && event.y < 85
        coin = Sprite.new(
            'coin.png',
            x: 200, y: 10,
            clip_width: 84,
            time: 50,
            loop: false
        )
        
         coin.play
      end
    end
end


# from room to clozet

on :mouse do |event|
    if event.type == :down
      if event.x > 1420 && event.x < 1700 && event.y > 340 && event.y < 800 && number_of_page == 1
        number_of_page = 4
        Image.new("4.png")
        mony_count()
        Image.new(
          "dots.png",
          x: 1760, y: 15,
          width: 120, height: 120)
        Image.new(
         "toda_dress.png",
          x: 60, y: 0)
    
      end
    end
end


# change dress

on :mouse do |event|
    if event.type == :down
      if event.x > 1400 && event.x < 1600 && event.y > 290 && event.y < 435 && number_of_page == 4
        Image.new("4.png")
        mony_count()
        Image.new(
          "dots.png",
          x: 1760, y: 15,
          width: 120, height: 120)
        Image.new("4.png")
        Image.new(
          "dots.png",
          x: 1760, y: 15,
          width: 120, height: 120)
        Image.new(
         "toda_red_dress.png",
          x: 59, y: 0)
        file = File.open("mony.txt")
        mony = file.read
        File.write("mony.txt", mony.to_i - 100)

        mony_count()
    
      end
    end
end

# from room to todo list

on :mouse do |event|
    if event.type == :down
      if event.x > 430 && event.x < 770 && event.y > 65 && event.y < 490 && number_of_page == 1
        number_of_page = 3
        Image.new("3.png")
        mony_count()
        Image.new(
          "dots.png",
          x: 1760, y: 15,
          width: 120, height: 120)
      end
    end
end


on :mouse do |event|
  if event.type == :down && number_of_page == 5
    if event.x > 455 && event.x < 1455 && event.y > 260 && event.y < 370
      number_of_page = 3
      Image.new("3.png")
      mony_count()
      Image.new(
        "dots.png",
        x: 1760, y: 15,
        width: 120, height: 120)
    elsif event.x > 435 && event.x < 1475 && event.y > 460 && event.y < 555
      number_of_page = 4
      Image.new("4.png")
      mony_count()
      Image.new(
        "dots.png",
        x: 1760, y: 15,
        width: 120, height: 120)
      Image.new(
        "toda_dress.png",
         x: 60, y: 0)


    elsif event.x > 730 && event.x < 1200 && event.y > 670 && event.y < 735
      number_of_page = 2
      Image.new("2.png")
      mony_count()
      Image.new(
        "dots.png",
        x: 1760, y: 15,
        width: 120, height: 120)
    end
  end 
end


on :mouse do |event|
    # A mouse event occurred
    if event.x > 1765 && event.x < 1870 && event.y > 55 && event.y < 100 && event.type == :down
        if  number_of_page == 1
            number_of_page = 5
            Image.new("5.png")
            mony_count()
            Image.new(
                "dots.png",
                x: 1760, y: 15,
                width: 120, height: 120)
        elsif number_of_page =! 5
            number_of_page =1
            Image.new("5.png")
            mony_count()
            Image.new(
                "dots.png",
                x: 1760, y: 15,
                width: 120, height: 120)
        else 
            number_of_page = 1
            Image.new("1.png")
            Image.new(
                "toda.png",
                x: 80, y: 250,
            )

            mony_count()
            Image.new(
                "dots.png",
                x: 1760, y: 15,
                width: 120, height: 120)
        end

    end
end


# to do list mony

on :mouse do |event|
  if event.type == :down && number_of_page == 3
    if event.x > 245 && event.x < 360 && event.y > 305 && event.y < 415
      number_of_page = 3
      Image.new("3.png")
      Image.new(
                "dots.png",
                x: 1760, y: 15,
                width: 120, height: 120)
        if done == 0
            done = 1
            file = File.open("mony.txt")
            mony = file.read
            File.write("mony.txt", mony.to_i + 25)
            mony_count()
            Image.new(
                "tick.png",
                x: 35, y: 100,
                width: 600, height: 600)
        elsif done == 1
            Image.new("3.png")
            Image.new(
                "dots.png",
                x: 1760, y: 15,
                width: 120, height: 120)
            done = 0
            mony_count()


        end  
    end
  end 
end


show