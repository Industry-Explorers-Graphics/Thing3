#!/usr/bin/env luajit

--cpuApp.lua
--a way to do explicit path finding
package.path = "../?.lua;"..package.path;


--[[
	Test using the GuiApp concept, whereby the interactor
	is a pluggable component.
--]]
local gap = require("graphicsLib.GuiApp")
local colors = require("graphicsLib.colors")
local procfs = require("lj2procfs.procfs")

local awidth = 640;
local aheight = 480;

local meminfo = procfs.meminfo
--print(meminfo)

--convert KB to MB
local memUsed = (meminfo.MemTotal - meminfo.MemAvailable) / 1024;
local memAvail = meminfo.MemAvailable / 1024;
local memTotal = meminfo.MemTotal / 1024;

local xMin = 20;
local xMax = 320;
local offset = nil;

--print(memUsed)
function map( value, xMin, xMax )
    local offset = ( value / awidth ) * ( xMax - xMin )
   
    return offset
end

local dc = nil;

--[[
	Mouse Activity functions.  Implement whichever
	ones of these are appropriate for your application.

	It is ok to not implement them as well, if your
	application doesn't require any mouse activity.
--]]
function mousePressed()
    if mouseButton == 1 and dc:contains( mouseX, mouseY ) then
        --print( "Thank you for selecting" )
       return true
    else
        --print( "Please click inside of rectangle" )
        return false
    end
end

function mouseReleased()
    if mousePressed() then
        print( "I'm free!" )
        sleep(.1)
        mouseButton = 0
        return true
    end
end

function mouseDragged()
end

function mouseMoved()
end

--[[
	Keyboard Activity functions.

	Implement as many of these as your application needs.
--]]
function keyPressed()
end

function keyReleased()
end

function keyTyped(achar)
	--print("keyTyped: ", achar)

	if keyChar ~= nil then
		print(keyChar);
	end
end

-- A setup function isn't strictly required, but
-- you MUST at least call gap.size(), or no window
-- will be created.
function setup()
	print("setup")
	dc = size(awidth,aheight)
end

local count = 1;

-- the loop function will be called every time through the 
-- event loop, regardless of any frame rate.  This might be
-- fine when you don't mind stalling the loop, and you don't
-- particularly care about frame rate.
function loop()
	--print("loop: ", count)
	count = count + 1;
    
    
    --redraw the frameBuffer with black
    dc:rect( 0, 0, 640, 480, colors.BLACK )
    
    --start app drawings
    dc:text( 2, 2, "MEMORY USAGE", colors.WHITE )
    
    local availOffset = map(memAvail, xMin, xMax)
    dc:rect( xMin, 170, xMin + availOffset, 20, colors.GREEN )
    --dc:text( xMin + availOffset + 20, 130, "AVAILABLE", colors.WHITE )

    local usedOffset = map(memUsed, xMin, xMax)
    dc:rect( xMin, 210, xMin + usedOffset, 20, colors.PURPLE )
    
    local usedString = tostring(memUsed)
    --dc:text( xMin + usedOffset + 20, 80, "USED", colors.WHITE )    

    local totalOffset = map( memTotal, xMin, xMax )
    dc:rect( xMin, 250, xMin + totalOffset, 20, colors.BLUE )
    
    --incorporate time
    local seconds = os.clock()
    seconds = seconds * 60
    local memWidth = 0 + seconds
    
    if memWidth > awidth then
       memWidth = 0
    end
 
    --dc:circleFill( 0 + seconds, 60, 5, colors.ORANGE )
    --dc:text( 45, 35, "OK", colors.WHITE ) 
    --dc:rect( 0, 70, 0 + seconds, 2, colors.RED )
   
    dc:diagonal( 0, 70 + (memAvail / awidth), memWidth, 70 + (memAvail / awidth), colors.RED )    
 
    if mousePressed() then
    end
end

--will not work in Windows
function sleep(n)
  os.execute("sleep " .. tonumber(n))
end

local function tick()
	local count = 1

    while true do
		print("tick: ", count)
		count = count + 1;
		yield();
	end
end

--spawn(tick)

run()
