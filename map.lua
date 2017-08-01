local Cell = require('cell')

local mapClass = { }
mapClass.__index = mapClass

function Map(x, y)
  local instance = {
    xOrigin = x,
    yOrigin = y,
    cells = { }
  }
  setmetatable(instance, mapClass)
  return instance
end

-- delete when generation is complete
local map = map16bit
local mapWidth = 16
local windowWidth, windowHeight = love.graphics.getDimensions()
local tileWidth = windowWidth/mapWidth
local tileHeight = windowHeight/(#map/mapWidth)

-- build map
function self:generate()
  local mapWidth = 300 --hardcode alert
  local mapHeight = 300 --hardcode alert
  local directions = { up, down, left, right }
  -- hardcode alert, cell-size aware
  -- could make class-level methods here for accessing
  -- the properties of a cell, like the size
  local dx = { up=0, down=0, left=-1, right=1 }
  local dy = { up=-1, down=1, left=0, right=0 }
  for idx, d in ipairs(directions) do
    local cell = Cell(xPlacement, yPlacement)
    -- choose a direction
    cellX = self.xOrigin + dx[direction]
    cellY = self.yOrigin + dy[direction]
    -- check if there is already a cell there

    -- if there is, choose a new direction

    -- if not, put the new cell in

    table.insert(self.cells, cell)
  end

end

-- helper to tell if a is between
-- b(lower bound) and c(upper bound)
function isBetween(a, b, c)
  if a >= b and a <= c then
    return true
  end
  return false
end

-- delete when generation is complete
function makeMap()
  local Wall = require('wall')
  local walls = {}
  for idx, tile in ipairs(map) do
    if tile == 1 then
      local x = (idx-1)%mapWidth
      local y = math.floor((idx-1)/mapWidth)
      local wallX = x*tileWidth
      local wallY = y*tileHeight
      local wall = Wall(wallX, wallY, tileWidth, tileHeight)
      table.insert(walls, wall)
    end
  end
  return walls
end

return Map