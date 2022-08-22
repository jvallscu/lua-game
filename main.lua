io.stdout:setvbuf("no")


--Version 0.0 of slime game



function love.load()
  
  Object = require "classic"
  
  require "free_tile"
  
  require "ground"
  
  require "house"
  
  require "Tree"
  
  
  ground = Ground(0,0)
  grass = Scene()
  house = House(300, 240)
  
  tree = Tree(500, 336)
  tree1 = Tree(600, 336)
  tree2 = Tree(700, 336)
  tree3 = Tree(800, 336)
  
  ground:load()
  grass:load()
end

function love.update(dt)


end

function love.draw()
  
  ground:draw()
  
  --grass:draw()
  
  house:draw()
  
  tree:draw()
  tree1:draw()
  tree2:draw()
  tree3:draw()
end
