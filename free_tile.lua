
Scene = ObjectPlus:extend()

frame_width = 32
frame_height = 32
  
function Scene:new(self)
  

end

function Scene:load()


  scene = love.graphics.newImage("FD_Free_Tiles.png")
  
  frames = {}

  local width = scene:getWidth()
  local height = scene:getHeight()
  
  frames = make_frame(scene, frames, width, height)
  
  x_frame = width / frame_width
  y_frame = height / frame_height
  
  
end

function Scene:update()
  
  
  
end

function Scene:draw()
  
  
  
end




