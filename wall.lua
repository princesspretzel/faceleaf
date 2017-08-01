-- lua stuff to look up later,
-- necessary to set up class
local wallClass = { }
wallClass.__index = wallClass

function wallClass:draw()
    love.graphics.setColor(0, 255, 0)
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end

-- constructor
function Wall(x, y, w, h)
    local instance = {
        x = x,
        y = y,
        w = w,
        h = h,
    }

    -- first argument is what you want
    -- to mutate, second is the value
    -- of the metatable (basically a 
    -- javascript prototype)
    setmetatable(instance, wallClass)
    return instance 
end

-- this makes the module return the function
return Wall