local Wall = require('wall')
local Player = require('player')

entities = { }
-- lua uses curly braces for
-- both array and hashtables
local start_x = 100
local start_y = 100
local touching = false
local contained = false
local player = Player(10, 10)
-- x, y, w, h
local i = Wall(200, 100, 200, 100)
local ii = Wall(400, 400, 10, 10)
local iii = Wall(600, 200, 100, 70)

table.insert(entities, i)
table.insert(entities, ii)
table.insert(entities, iii)
table.insert(entities, player)

-- is b contained within a
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
