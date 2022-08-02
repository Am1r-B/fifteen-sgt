function love.load()
  love.graphics.setNewFont(30)
  
  gridXCount = 4
  gridYCount = 4
  
  grid = {}
  
  for y = 1, gridYCount do
    grid[y] = {}
    for x = 1, gridXCount do
      grid[y][x] = (y - 1) * gridXCount + x
    end
  end
end

function love.keypressed(key)
  local emptyX
  local emptyY
  
  for y = 1, gridYCount do
    for x = 1, gridXCount do
      if grid[y][x] == gridXCount * gridYCount then
        emptyX = x
        emptyY = y
      end
    end
  end
  
  local newEmptyY = emptyY
  
  if key == 'down' then
    newEmptyY = emptyY - 1
  elseif key == 'up' then
    newEmptyY = emptyY + 1
  end
  
  if grid[newEmptyY] then
    grid[emptyY][emptyX], grid[newEmptyY][emptyX] = 
    grid[newEmptyY][emptyX], grid[emptyY][emptyX]
  end
end

function love.draw()
  for y = 1, gridYCount do
    for x = 1, gridXCount do
      if grid[y][x] ~= gridXCount * gridYCount then
        local pieceSize = 100
        local pieceDrawSize = pieceSize - 1
        
        love.graphics.setColor(.4, .1, .6)
        love.graphics.rectangle(
          'fill',
          (x - 1) * pieceSize,
          (y - 1) * pieceSize,
          pieceDrawSize,
          pieceDrawSize
        )
        
        love.graphics.setColor(1, 1, 1)
        love.graphics.print(
          grid[y][x],
          (x - 1) * pieceSize,
          (y - 1) * pieceSize
        )
      end
    end
  end
end