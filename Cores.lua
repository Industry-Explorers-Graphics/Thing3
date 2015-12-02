package.path = package.path..";../?.lua;graphicsLib/?.lua;lj2core/?.lua;lj2procfs/?.lua;x11/?.lua"

local procfs = require("procfs")
local fun = require("fun")


local function printInfo(processor)
    if processor ~= nil then
        print(string.format("processor: %d, core: %s", processor.processor, tostring(processor.core_id)))
    else
        print("Couldn't find any")
    end
end

fun.each(printInfo, procfs.cpuinfo)
