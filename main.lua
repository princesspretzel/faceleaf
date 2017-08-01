local Wall = require('wall')
local Player = require('player')
local MakeMap = require('map')

-- lua uses curly braces for
-- both arrays and hashtables
entities = { }
local touching = false
local errorMargin = 10
local contained = false
local player = Player(50, 50)

-- push player and walls into
-- entities
table.insert(entities, player)
for idx, x in ipairs(MakeMap) do
    table.insert(entities, x)
end

-- is b contained within a?
function isContained(a, b)
    if b.x < a.x then
        return false
    end 
    if b.y < a.y then
        return false
    end
    if (b.x + b.w) > (a.x + a.w) then
        return false
    end 
    if (b.y + b.h) > (a.y + a.h) then
        return false
    end
    return true
end

-- are a and b touching?
function isTouching(a, b)   
    if (a.x > (b.x + b.w)) or (b.x > (a.x + a.w)) then
        return false
    end  
    if (a.y > (b.y + b.h)) or (b.y > (a.y + a.h)) then
        return false
    end

    return true
end

function love.draw()
    -- ipairs is a function in lua,
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
