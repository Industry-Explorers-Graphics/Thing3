--slider.lua
local drawLib = require("render_ffi")
local colors = require("colors")

local Handle = {}
local Handle_mt = {
  __index = Handle;
}

local Bar = {}
local Bar_mt = {
  __index = Bar;
}

local Slider = {}
local Slider_mt = {
  __index = Slider;
}

function Bar.new(self, x, y, width, height, color)
  local obj = {
    x = x;
    y = y;
    width = width;
    height = height;
    color = color;
  }
  setmetatable(obj, Bar_mt)
  return obj
end

function Bar.draw(self, fb)
  drawLib.drawRectFill(fb, self.x, self.y, self.width, self.height, self.color);
end

function Handle.new(self, x, y, radius, color)
  local obj = {
    x = x;
    y = y;
    radius = radius;
    color = color;
  }
  setmetatable(obj, Handle_mt)
  return obj
end


function Handle.draw(self, fb)
  drawLib.drawCircleFill(fb , self.x, self.y, self.radius, self.color);
end

function Slider.new(self, x, y, width, height, color, isDragging)
  local obj = {
    x = x;
    y = y;
    width = width;
    height = height;
    color = color;
    isDragging = isDragging;
  }
  setmetatable(obj, Slider_mt)
  return obj
end 

function Slider.draw(self, fb)
  local bar = Bar:new(self.x, 0.5 * self.height, self.width, 0.5 * self.height, colors.BLUE)
	local handle = Handle:new(self.x + (0.5 * self.height), self.y + (0.25 * self.height), 0.5 * self.height, colors.YELLOW)
  bar:draw(fb)
  handle:draw(fb)
end

function Slider.onMouseActivity(self, fb, event)
  return 0
end

-- check if point is within the bar
function Slider.contains(self, x, y)
  if x >= self.x and x <= self.x + self.width and y >= (0.5 + self.height) and y <= self.y + self.height then
    return true
  else
    return false
  end
end

return Slider
