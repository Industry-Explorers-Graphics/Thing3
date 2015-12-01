--drawPushButton.lua
local drawLib = require( "render_ffi" )
local lbl = require( "label" )
local colors = require( "colors" )
local ppm = require( "ppm" )
local boundingbox = require( "boundingbox" )
local pushButton = require( "pushButton" )

--create the framebuffer
local width = 340;
local height = 240;
local x = 0;
local y = 0;
local data = nil;
local pixelStride = 0;

local fb = drawLib.createFrameBuffer( width, height, x, y, data, pixelStride )
assert(fb ~= nil)

bbox = boundingbox:new(200, 200, 2, 2, colors.PINK, {
    pushButton:new(10, 5, 10, { lbl:new(10, 5, "Hi Anne and Kamilah!", colors.WHITE ) }, 0 )
})
bbox:draw(fb)

ppm.write_PPM_binary("button.ppm", fb.data, fb.width, fb.height, 4*width)
