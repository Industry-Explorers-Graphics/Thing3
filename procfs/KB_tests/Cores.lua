local procfs = require("lj2procfs.procfs")
local fun = require("lj2procfs.fun")


local function printInfo(processor)
    print(processor[1])
    if processor ~= nil then
        print(string.format("processor: %d, core: %d", processor.processor, processor.core_id))
    else
        print("Couldn't find any")
    end
end

fun.each(printInfo, procfs.cpuinfo)
