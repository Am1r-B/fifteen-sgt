function love.draw()
  local pieceSize = 100
  local pieceDrawSize = pieceSize - 1
  
  for y = 1, 4 do
    for x = 1, 4 do
      love.graphics.setColor(.4, .1, .6)
      love.graphics.rectangle(
        'fill',
        (x - 1) * pieceSize,
        (y - 1) * pieceSize,
        pieceDrawSize,
        pieceDrawSize
      )
    end
  end
end