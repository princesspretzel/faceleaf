local playerClass = { }
playerClass.__index = playerClass

function Player(x, y)
	local instance = {
		x = x,
		y = y,
		w = 60,
		h = 35,
		speed = 100,
	}

	setmetatable(instance, playerClass)
	return instance
end

function playerClass:isOutOfBounds()
	local width, height = love.window.getDimensions()

	if self.x == width or 0 then
		return true
	end
	if self.h == height or 0 then
		return true
	end
	return false
end

function playerClass:isTouching(entities)
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

function playerClass:draw()
    love.graphics.setColor(255, 255, 255)
    leaf = love.graphics.newImage('/images/Leaf_Calm.png')
    love.graphics.draw(leaf, self.x, self.y)
    love.graphics.print(touching and "touching" or "nope", 10, 10)
    -- love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end

function playerClass:update(dt)
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
            self.x = self.x - dx
            self.y = self.y - dy
        end
    end
end

return Player