Tree = Scene:extend()

local init_ycoord = 1
local init_xcoord = 13
local obj_width = 1
local obj_height = 2

function Tree:new(x, y)
  
  House.super.new(self)
  self.x = x
  self.y = y
end

function Tree:load()

  

end


function Tree:update()
  
  
  
end

function Tree:draw()
  
  select_obj(init_xcoord, init_ycoord, obj_width, obj_height, self.x, self.y)

end