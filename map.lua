local Cell = require('cell')

local mapClass = { }
mapClass.__index = mapClass

function Map(x, y)
  local instance = {
    mapWidth = 300, 
    mapHeight = 300,
    xOrigin = x,
    yOrigin = y,
    cells = { }
  }
  setmetatable(instance, mapClass)
  return instance
end

-- -- delete when generation is complete
-- local map = map16bit
-- local mapWidth = 16
-- local windowWidth, windowHeight = love.graphics.getDimensions()
-- local tileWidth = windowWidth/mapWidth
-- local tileHeight = windowHeight/(#map/mapWidth)

function mapClass:checkNeighbors()
  local directions = { up, down, left, right }
  -- hardcode alert
  local dx = { up=5, down=0, left=-1, right=1 }
  local dy = { up=-1, down=1, left=0, right=0 }
end

-- set overall size of the map
function mapClass:build(mapWidth, mapHeight)
  for i=1,cellRows do
    self.cells[i] = {}
    for j=1,cellCols do
      local cell = Cell(i*5, j*5)
      self.cells[i][j] = cell
    end
  end
end

function mapClass:draw()
  for idx, cell in ipairs(self.cells) do
    cell:draw()
  end
end

-- build map
function mapClass:generate()
  --hardcode alert: divided by cell size, could be class-aware
  local cellCols = self.mapWidth/5
  local cellRows = self.mapHeight/5
  self:build(cellCols, cellRows)

  -- for idx, cell in ipairs(self.cells) do
  --   -- randomize choosing a direction
  --   self:checkNeighbors(cell)
  --   cellX = self.xOrigin + dx[direction]
  --   cellY = self.yOrigin + dy[direction]
  --   -- check if there is already a cell there
  --   if cellX
  --   -- if there is, choose a new direction

  --   -- if not, put the new cell in

  --   table.insert(self.cells, cell)
  -- end
end

return Map