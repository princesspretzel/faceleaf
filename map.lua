local Map = require('maps')

-- choose map
local map = map8bit
local mapWidth = 8

local windowWidth, windowHeight = love.graphics.getDimensions()
local tileWidth = windowWidth/mapWidth
local tileHeight = windowHeight/(#map/mapWidth)

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

return makeMap