local wall = require('wall')

-- lua uses curly braces for
-- both array and hashtables
local entities = { }

local player = {
    x = 100, 
    y = 100,
    speed = 100,
}

local i = wall(10, 100, 10, 100)

table.insert(entities, i)
table.insert(entities, player)

function player:draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle('fill', self.x, self.y, 20, 20)
end

function player:update(dt)
    -- every frame the key is down for,
    -- this is called -- so 60fps
    local dx, dy = 0, 0    

    if love.keyboard.isDown('left') then
        dx = -1
    end
    if love.keyboard.isDown('right') then
        dx = 1
    end
    if love.keyboard.isDown('down') then
        dy = 1
    end
    if love.keyboard.isDown('up') then
        dy = -1
    end

    -- normalize diagonal vector
    -- and don't run it unless
    -- keys are actually being
    -- pressed
    if dx ~= 0 or dy ~= 0 then
        local length = (dx^2+dy^2)^.5
        dx = dx/length
        dy = dy/length

        self.x = self.x + dx * (self.speed*dt)
        self.y = self.y + dy * (self.speed*dt)
    end
end

function love.draw()
    -- ipairs is a function in lua
    -- a constructor for an iterator
    -- because array tables are not
    -- iteratable by default
    for idx, entity in ipairs(entities) do
        entity:draw()
    end
end

-- dt == the amount of time (in seconds)
-- elapsed since the last frame 
-- better to base speed of game on dt
-- instead of depending on framerate
function love.update(dt)
    for idx, entity in ipairs(entities) do
        entity:update(dt)
    end
end
