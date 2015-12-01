--radiobutton.lua
local drawLib = require("render_ffi")
local colors = require("colors")
local math = require("math")


local RadioButton = {}
local RadioButton_mt = {
  __index = RadioButton;
}

function RadioButton.new(self, x, y, color, state)
  local obj = {
    x = x;
    y = y;
    radius = 5;
    color = color;
    state = state;
  }
  setmetatable(obj, RadioButton_mt)
  return obj
end 

function RadioButton.draw(self, fb)
  if self.state == 0 then
    drawLib.drawCircleFill(fb, self.x, self.y, self.radius, self.color)
    drawLib.drawCircleFill(fb, self.x, self.y, self.radius - 2, colors.BLACK)
  end
  if self.state == 1 then
    drawLib.drawCircleFill(fb, self.x, self.y, self.radius, self.color)
    drawLib.drawCircleFill(fb, self.x, self.y, self.radius - 2, colors.BLACK)
    drawLib.drawCircleFill(fb, self.x, self.y, self.radius - 3, self.color);
  end
end

function RadioButton.contains(self, x, y)
  d = math.sqrt((self.x - x)^2 + (self.y - y)^2);
  return d <= self.radius;
end

return RadioButton
