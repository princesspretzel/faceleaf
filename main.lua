local wall = require('wall')

-- lua uses curly braces for
-- both array and hashtables
local entities = { }
local touching = false
local player = {
    x = 100, 
    y = 100,
    w = 30,
    h = 30,
    speed = 100,
}

-- x, y, w, h
local i = wall(200, 100, 200, 100)
local ii = wall(400, 400, 10, 10)
local iii = wall(600, 200, 100, 70)

table.insert(entities, i)
table.insert(entities, ii)
table.insert(entities, iii)
table.insert(entities, player)

function isTouching(a, b)   
    if (a.x > (b.x + b.w)) or (b.x > (a.x + a.w)) then
        return false
    end  
    if (a.y > (b.y + b.h)) or (b.y > (a.y + a.h)) then
        return false
    end

    return true
end

function player:isTouching(entities)
    for idx, e in ipairs(entities) do
        if e ~= self then
            touching = isTouching(self, e)
            if touching then
                return true
            end
        end
    end
    return false
end

function player:draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
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
        dx = dx/length * self.speed*dt
        dy = dy/length * self.speed*dt

        self.x = self.x + dx
        self.y = self.y + dy
        touching = false
        if self:isTouching(entities) then
            touching = true
            -- self.x = self.x - dx
            -- self.y = self.y - dy
        end
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
    love.graphics.print(touching and "touching" or "nope", 10, 10)
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
