--pushButton.lua
local ffi = require( "ffi" )
local drawLib = require( "render_ffi" );
local colors = require( "colors" );
local dc = require( "DrawingContext" );

local PushButton = {}
local PushButton_mt = {
    __index = PushButton;
}

-- need to implement children.length
function PushButton.new( self, x, y, children, state )
    children = children or {} 
    local obj = {
        x = x;
        y = y;
        height = 30;
        children = children;
        --width = children.length[1] or 60;
        width = 60;
        state = 0;
    }
    setmetatable( obj, PushButton_mt )

    return obj
end

function PushButton.draw( self, dc )
    if self.state == 0 then
        dc:rect( self.x, self.y, self.width, self.height, colors.RED )
    else
        dc:rect( self.x, self.y, self.width, self.height, colors.PURPLE )
    end
    if self.children ~= nil then
        for _,child in ipairs( self.children ) do
        child:draw( dc )
        end
    end
end

function PushButton.contains( self, x, y )
    if x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height then
    return true
  else
    return false
  end
end

return PushButton
