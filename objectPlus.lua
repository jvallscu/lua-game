ObjectPlus = Object:extend()


frame_width = 32
frame_height = 32

function ObjectPlus:new(self)

end


function make_frame(image, new_frame, width, height)


  new_frame = {}
  
  x_frame2 = width / frame_width
  y_frame2 = height / frame_height
  
  for i=0,x_frame2 - 1  do
    for j=0,y_frame2 - 1  do
      table.insert(new_frame, love.graphics.newQuad(i * frame_width, j * frame_height, frame_width, frame_height, width, height))
    end
  end
  
  return new_frame
end


function select_char( image, new_frame, init_x, init_y, obj_width, obj_height, x, y)
  
  
  for i=1,obj_width do
    for j=1,obj_height do
      love.graphics.draw( image, new_frame[init_y + x_frame2 * init_x], x + i * frame_width, y + j * frame_height)
      init_y = init_y + 1
    end
    
    --Skips over to the next column of the file, making sure to keep object aligned
    init_y = init_y + y_frame2 - obj_height
  end
end

return ObjectPlus

