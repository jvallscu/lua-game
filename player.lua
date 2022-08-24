--Character that the player will use

Player = Object:extend()

-- The game will be based on a 32x32 pixel tile system
local frame_width = 32
local frame_height = 32

--Used for animation to switch between slime up movement and down movement
local switch = 1
--Used to switch between left and right animations for slime
local dir_switch = 1

local frame_lr = {0, 2, 4, 6, 8}
function Player:new(x,y)
  
  self.x = x
  self.y = y
  
end

function Player:load()
  
  player = love.graphics.newImage("slimev0.7.png")
  
  print(player)
  char_frame = {}
  print(char_frame)
  
  
  local width = player:getWidth()
  local height = player:getHeight()
  
  
  
  
  x_frame2 = width / frame_width
  y_frame2 = height / frame_height
  
  print(x_frame2)
  print(y_frame2)
  
  for i=0,x_frame2 - 1  do
    for j=0,y_frame2 - 1  do
      table.insert(char_frame, love.graphics.newQuad(i * frame_width, j * frame_height, frame_width, frame_height, width, height))
    end
  end
  
  --This frame represents the slime at a neutral state, not stretched and squashed
  
  currentFrame = 2
end

function Player:update(dt)
  
  
  --Covers slime movement conditions for all directions
  if love.keyboard.isDown("down") and love.keyboard.isDown("right") then
    self.x = self.x + 100 * dt
    self.y = self.y + 100 * dt
    dir_switch = 1
    move_bounce(dt)
  elseif love.keyboard.isDown("down") and love.keyboard.isDown("left") then
    self.x = self.x - 100 * dt
    self.y = self.y + 100 * dt
    dir_switch = 5
  elseif love.keyboard.isDown("up") and love.keyboard.isDown("right") then
    self.x = self.x + 100 * dt
    self.y = self.y - 100 * dt
    dir_switch = 1
  elseif love.keyboard.isDown("up") and love.keyboard.isDown("left") then
    self.x = self.x - 100 * dt
    self.y = self.y - 100 * dt
    dir_switch = 5
  elseif love.keyboard.isDown("left") then
    self.x = self.x - 100  * dt
    dir_switch = 5
    move_bounce(dt)
  elseif love.keyboard.isDown("right") then
    self.x = self.x + 100 * dt
    dir_switch = 1
    move_bounce(dt)
  elseif love.keyboard.isDown("up") then
    self.y = self.y - 100 * dt
  elseif love.keyboard.isDown("down") then
    self.y = self.y + 100 * dt

  end
  
end

function move_bounce(dt)
  
  
  currentFrame = currentFrame + 8 * dt * switch
  print(currentFrame)
  if currentFrame >= 6 then
    switch = -1
    currentFrame = 5.9
  end
  
  if currentFrame <= 1 then
    switch = 1
    currentFrame = 1.1
  end
  
end

function love.keyreleased(key)
  if key == "left" then
    currentFrame = 2
    dir_switch = 5
  
  elseif key == "right" then
    currentFrame = 2
    dir_switch = 1
  end
end 


function Player:draw()
  
  
  select_char( player, frame_lr[math.floor(currentFrame)], dir_switch, 2, 4, self.x , self.y)
  print(currentFrame)
  
  
end



function select_char( image, init_x, init_y, obj_width, obj_height, x, y)
  
  
  for i=1,obj_width do
    for j=1,obj_height do
      love.graphics.draw( image, char_frame[init_y + x_frame2 * init_x], x + i * frame_width, y + j * frame_height)
      init_y = init_y + 1
    end
    
    --Skips over to the next column of the file, making sure to keep object aligned
    init_y = init_y + y_frame2 - obj_height
  end
end
