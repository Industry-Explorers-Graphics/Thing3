--boundingbox.lua
local ffi = require("ffi")
local drawLib = require("render_ffi")

local BoundingBox = {}
local BoundingBox_mt = {
  __index = BoundingBox;
}

function BoundingBox.new(self, x, y, width, height, color, children)
  local obj = {
    x = x;
    y = y;
    length = length;
    width = width;
    color = color;
    children = children;
  }
  setmetatable(obj, BoundingBox_mt)
  return obj
end

function BoundingBox.draw(self, fb)
  drawLib.drawRectFrame(fb, self.x, self.y, self.width, self.length, self.color) 
  if self.children ~= nil then 
    for _,child in ipairs(self.children) do
      child:draw(fb)
    end
  end
end

function BoundingBox.contains(self, x, y)
  --our drawRect function is very simple so this will work
  --if drawRect changes we'll need more sophisticated point in polygon checks
  if x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.length then
    return true
  else
    return false
  end
end

return BoundingBox  
