local cellClass = { }
cellClass.__index = cellClass

function Cell(x, y)
  local instance = {
    x = x,
    y = y,
    w = 5,
    h = 5,
    visited = false
  }
end

function cellClass:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle(self.x, self.y, self.w, self.h)
end

return Cell