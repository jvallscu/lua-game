


Gui = ObjectPlus:extend()

on_state = 0

function Gui:new(x, y)

  Gui.super.new(self)
  self.x = x
  self.y = y
  
end


function Gui:load()
  
  gui_image = love.graphics.newImage("GUI_4x_1.png")
  
  gui_frame = {}
  
  local width =  gui_image:getWidth()
  local height = gui_image:getHeight() 
  
  
  gui_frame = make_frame(gui_image, gui_frame, width, height)
  
  
  start_stat = love.graphics.newImage("start_stat.png")
  
end


function Gui:update(dt)

  
end


function Gui:draw()
  
  if on_state == 1 then
    draw_start_stats(6, 3)
  
  elseif on_state == 2 then
    draw_inv(5,5)
  end
  
end


function love.keypressed(key)
  if key == 'c' and on_state == 1 then
    on_state = 0
  elseif key == 'c' and on_state == 0 then
    on_state = 1
  elseif key == 'i' and on_state == 0 then
    on_state = 2
  elseif key == 'i' and on_state == 2 then
    on_state = 0
  end  
  
  
end


function draw_gui(width, height, offset)
  
  
  x = 700
  y = 350
  temp_x = 1
  temp_y = 0
  --Top left corner of box frame
  select_char(gui_image, gui_frame, 0 + offset, 5, 2, 2, x + 32, y)
  --Top left corner paper
  select_char(gui_image, gui_frame, 12, 1, 1, 1, x + 64, y + 32)
  
  
  
  for j = 0,height - 1 do
    for i=1,width do
      
      --Top bar
      select_char(gui_image, gui_frame, 1 + offset, 5, 1, 1, x + 32 * i + 64, y)
      --Top paper
      select_char(gui_image, gui_frame, 13, 1, 1, 1, x + 32 * i + 64, y + 32 )
      
      --Middle area paper
      select_char(gui_image, gui_frame, 13, 2, 1, 1, x + 32 * i + 64, y + 64 + 32 * j)
      
      
      --Bottom middle bar
      select_char(gui_image, gui_frame, 1 + offset, 7, 1, 1, x + 32 * i + 64, y + 32 * height + 96)
      --Bottom middle paper
      select_char(gui_image, gui_frame, 13, 3, 1, 1, x + 32 * i + 64, y + 32 * height + 64)
      
      temp_x = i + 3
      
    end
  end
  
  --Top right corner of box, frame
  select_char(gui_image, gui_frame, 1 + offset, 5, 2, 2, x + 32 * temp_x, y)
  --Top right corner of box, paper
  select_char(gui_image, gui_frame, 14, 1, 1, 1, x + 32 * temp_x, y + 32)
  
  
  for j = 0,height - 1 do
    --Left side bar
    select_char(gui_image, gui_frame, 0 + offset, 6, 1, 1, x + 32, y + 64 + 32 * j)
    --Left side paper
    select_char(gui_image, gui_frame, 12, 2, 1, 1, x + 64, y + 64 + 32 * j)
    
    --Right middle side of box, paper
    select_char(gui_image, gui_frame, 14, 2, 1, 1, x + 32 * temp_x, y + 64 + 32 * j)
    --Right middle sideof box, frame
    select_char(gui_image, gui_frame, 2 + offset, 6, 1, 1, x + 32 * temp_x + 32, y + 64 + 32 * j)
    
  end
  
  
  --Bottom left of box, frame
  select_char(gui_image, gui_frame, 0 + offset, 6, 2, 2, x + 32, y + 32 * height + 64)
  --Bottom left of box, paper
  select_char(gui_image, gui_frame, 12, 3, 1, 1, x + 64, y + 32 * height + 64)
  
  
  --Bottom right of box, frame
  select_char(gui_image, gui_frame, 1 + offset, 6, 2, 2, x + 32 * temp_x, y + 32 * height + 64)
  --Bottom right of box, paper
  select_char(gui_image, gui_frame, 14, 3, 1, 1, x + 32 * temp_x, y + 32 * height + 64)
  
  
  
  

end


function draw_start_stats(width,height)

  draw_gui(width,height, 3)
  love.graphics.draw(start_stat, x + 124, y + 80, 0, 0.75)
end


function draw_inv(width, height)
  draw_gui(width,height, 0)
  
end


