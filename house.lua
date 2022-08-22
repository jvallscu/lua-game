
House = Scene:extend()

local init_ycoord = 4
local init_xcoord = 0
local obj_width = 5
local obj_height = 5

function House:new(x, y)
  
  House.super.new(self)
  self.x = x
  self.y = y
end

function House:load()

  

end


function House:update()
  
  
  
end

function House:draw()
  
  select_obj(init_xcoord, init_ycoord, obj_width, obj_height, self.x, self.y)

end