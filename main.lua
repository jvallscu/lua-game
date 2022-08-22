io.stdout:setvbuf("no")


--Version 0.0 of slime game



function love.load()
  
  Object = require "classic"
  
  require "free_tile"
  
  require "ground"
  
  require "house"
  
  require "Tree"
  
  require "textures"
  
  
  ground = Ground(0,0)
  grass = Scene()
  house = House(1000, 240)
  
  texture = Texture()
  
  
  ground:load()
  grass:load()
  texture:load()
end

function love.update(dt)


end

function love.draw()
  
  ground:draw()
  
  --grass:draw()
  
  house:draw()
  
  
  
  texture:draw()
  
end
