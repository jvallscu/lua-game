io.stdout:setvbuf("no")


--Version 0.0 of slime game

local temp_x = 0
local temp_y = 0

function love.load()
  
  Object = require "classic"
  ObjectPlus = require "objectPlus"
  --Scene = require "free_tile"
  
  require "free_tile"
  
  require "ground"
  
  
  
  require "house"
  
  require "Tree"
  
  require "textures"
  
  require "player"
  
  require "gui"
  
  
  grass = Scene()
  ground = Ground(0,0)
  
  gui = Gui(10,10)
  
  house = House(2000, 220)
  
  texture = Texture()
  
  slime = Player(-32, 360)
  
  gui:load()
  ground:load()
  grass:load()
  texture:load()
  slime:load()
  
end

function love.update(dt)

  slime:update(dt)
  gui:update(dt)
end

function love.draw()
  
  --love.graphics.setCanvas(screenCanvas)
  love.graphics.push()
  
  
  
  --Implementing a camera system where camera changes when slime is on edges of the map
  
  if slime.x < 100 and slime.y > game_height - 200 then
    love.graphics.translate(-slime.x + 100, -slime.y + 520)
    temp_y = -slime.y
    temp_x = -slime.x
    print(temp_y)
  elseif slime.x < 100 and slime.y < 20 then
    love.graphics.translate(-slime.x + 100, -slime.y + 20)
    temp_x = -slime.x
    temp_y = -slime.y
  elseif slime.x > game_width - 250 then
    love.graphics.translate(-slime.x + game_width - 250, 0)
  elseif slime.x < 100 then
    love.graphics.translate(-slime.x + 100, 0)
    temp_x = -slime.x
    
  elseif slime.y > 520 then
    love.graphics.translate(temp_x + 100, -slime.y + 520)
  elseif slime.y < 520 and slime.y > 20 then
    love.graphics.translate(0,0)
  elseif slime.y < 120 then
    love.graphics.translate(temp_x + 100, -slime.y + 20)
  end
  
  ---
  
  
  
  
  
  
  
  ground:draw()
  
  
  texture:draw()
  
  house:draw()
  slime:draw()
  
  love.graphics.pop()
  --love.graphics.setCanvas()
  
  
  
  
  gui:draw()
  
  
  
  
end
