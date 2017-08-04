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

-- -- helper to tell if a is between
-- -- a(lower bound) and b(upper bound)
-- function cellClass:isBetween(a, b)
--   if ((self.x >= a) and (self.x a <= b)) then
--     return true
--   end
--   return false
-- end

function cellClass:draw()
  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle(self.x, self.y, self.w, self.h)
end

return Cell