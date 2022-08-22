Ground = Scene:extend()


local x_tiles = math.ceil(game_width/frame_width)
local y_tiles = math.ceil(game_height/frame_height)

function Ground:new(x, y)
  
  Ground.super.new(self)
  self.x = x
  self.y = y
end


function Ground:load()
  
  
  tilemap = {}
  for i = 1,math.ceil(game_width/frame_height) do
    tilemap[i] = {}
    
    for j = 1,math.ceil(game_height/frame_width) do
      tilemap[i][j] = 0
    end
    
    
    
  end
  
  

  
  tilemap[1][math.ceil(game_height/frame_width)] = 16
  
  for i=2,math.ceil(game_width/frame_height) - 1 do
    tilemap[i][math.ceil(game_height/frame_height)] = 32
  end
  
  tilemap[math.ceil(game_width/frame_width) ][math.ceil(game_height/frame_width)] = 48

  for i=1,40 do
    tilemap[i][15] = 204
  end

  
end



function Ground:draw()
  
  
  
  --select_obj(init_xcoord, init_ycoord, obj_width, obj_height, self.x, self.y)
  
  
 for i = 1,math.ceil(game_width/frame_width)  do
    for j = 1,math.ceil(game_height/frame_height) do
      if tilemap[i][j] == 0 then
        select_obj(2, 1, 1, 1, i * 32 - 64, j * 32 - 80)
      else
        ycoord = tilemap[i][j]
        if tilemap[i][j] % 16 == 0 then
          ycoord = 16
        end
        ycoord = tilemap[i][j] % 16
        if tilemap[i][j] ~= 0 then
          select_obj(math.floor(tilemap[i][j] / 16), ycoord, 1, 1, i * 32 - 64, j * 32 - 80)
        end
        
      end
    end
  end
  
end