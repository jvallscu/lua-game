
Scene = Object:extend()

frame_width = 32
frame_height = 32
  
function Scene:new(self)
  

end

function Scene:load()


  scene = love.graphics.newImage("FD_Free_Tiles.png")
  
  frames = {}
  
  
  
  local width = scene:getWidth()
  local height = scene:getHeight()
  
  
  x_frame = width / frame_width
  y_frame = height / frame_height
  
  print(x_frame)
  print(y_frame)
  
  
  for i=0,x_frame - 1  do
    for j=0,y_frame - 1  do
      table.insert(frames, love.graphics.newQuad(i * frame_width, j * frame_height, frame_width, frame_height, width, height))
    end
  end
end

function Scene:update()
  
  
  
end

function Scene:draw()
  
  
  
end


function select_obj( init_x, init_y, obj_width, obj_height, x, y)
  
  
  
  for i=1,obj_width do
    for j=1,obj_height do
      love.graphics.draw(scene, frames[init_y + x_frame * init_x], x + i * frame_width, y + j * frame_height)
      init_y = init_y + 1
    end
    
    --Skips over to the next column of the file, making sure to keep object aligned
    init_y = init_y + y_frame - obj_height
  end
  
end
