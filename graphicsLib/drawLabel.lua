--drawLabel.lua
local ffi = require( "ffi" )
local drawLib = require( "render_ffi" )
local lbl = require( "label" )
local colors = require( "colors" )
local ppm = require( "ppm" )
local boundingbox = require("boundingbox")

local width = 340;
local height = 100;
local x = 0;
local y = 0;
local data = nil;
local pixelStride = 0;

local fb = drawLib.createFrameBuffer( width, height, x, y, data, pixelStride )
assert( fb ~= nil )

bbox = boundingbox:new(50, 50, 2, 2, colors.PINK, {
    lbl:new( 5, 5, "B", colors.PINK )
})
bbox:draw(fb)


ppm.write_PPM_binary( "testText.ppm", fb.data, fb.width, fb.height, 4*width )
