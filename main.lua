io.stdout:setvbuf("no")


--Version 0.0 of slime game



function love.load()
  
  Object = require "classic"
  
  require "free_tile"
  
  require "ground"
  
  require "house"
  
  require "Tree"
  
  require "textures"
  
  require "player"
  
  
  ground = Ground(0,0)
  grass = Scene()
  house = House(1000, 220)
  
  texture = Texture()
  
  slime = Player(150, 400)
  
  ground:load()
  grass:load()
  texture:load()
  slime:load()
end

function love.update(dt)

  slime:update(dt)
  
end

function love.draw()
  
  
  ground:draw()
  
  
  texture:draw()
  
  house:draw()
  slime:draw()
  
  
end
