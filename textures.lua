Texture = Scene:extend()


local x_tiles = math.ceil(game_width/frame_width)
local y_tiles = math.ceil(game_height/frame_height)

function Texture:new()
  
  Texture.super.new(self)

end


function Texture:load()
  
  
  textureMap = {}
  for i = 1,math.ceil(game_width/frame_height) do
    textureMap[i] = {}
    
    for j = 1,math.ceil(game_height/frame_width) do
      textureMap[i][j] = 0
    end
  end
  
  textureMap_offset16 = {}
  for i = 1,math.ceil(game_width/frame_height) do
    textureMap_offset16[i] = {}
    
    for j = 1,math.ceil(game_height/frame_width) do
      textureMap_offset16[i][j] = 0
    end
  end
  
  textureMap_offset2 = {}
  for i = 1,math.ceil(game_width/frame_height) do
    textureMap_offset2[i] = {}
    
    for j = 1,math.ceil(game_height/frame_width) do
      textureMap_offset2[i][j] = 0
    end
  end
  
  --Makes a hatchet next to the house
  textureMap[math.floor((house.x + 1.5 * frame_width) / frame_width)][math.floor((house.y + 6 * frame_width) / frame_width)] = 161
  textureMap[math.floor((house.x + 1.5 * frame_width) / frame_width)][math.floor((house.y + 6 * frame_width) / frame_width) + 1] = 162
  
  --Creates a small landing in front of house
  textureMap_offset16[math.floor((house.x + 1 * frame_width) / frame_width) + 2][math.floor((house.y + 8 * frame_width) / frame_width)] = 234
  textureMap_offset16[math.floor((house.x + 1 * frame_width) / frame_width) + 3][math.floor((house.y + 8 * frame_width) / frame_width)] = 250
  
  
  
  
  
  --Creates a forest with an offset
  
  toggle = 1
  for i=0,x_tiles - 14,2 do
    for j=0,2 do
      textureMap[2 + i + toggle][2 + 3 * j] = 209
      textureMap[2 + i + toggle][2 + 3 * j + 1] = 210
      toggle = toggle * -1
    end
    
  end
  
  
  
  
  --Modifies path
  
  for i=1,40 do
    textureMap[i][17] = 203
    textureMap_offset2[i][17] = 205
  end
  
end

function Texture:draw()
  
  draw_tilemap(textureMap, 0, 0)
  draw_tilemap(textureMap_offset16, 24, 0)
  draw_tilemap(textureMap_offset2, 0, 8)
end



function draw_tilemap(tilemap, offset_x, offset_y)
  
  for i = 1,math.ceil(game_width/frame_width)  do
    for j = 1,math.ceil(game_height/frame_height) do
      ycoord = tilemap[i][j]
      if tilemap[i][j] % 16 == 0 then
          ycoord = 16
      end
      ycoord = tilemap[i][j] % 16
      if tilemap[i][j] ~= 0 then
        select_obj(scene, math.floor(tilemap[i][j] / 16), ycoord, 1, 1, i * 32 - 64 + offset_x, j * 32 - 80 + offset_y)
      end
    end
  end
  
end
