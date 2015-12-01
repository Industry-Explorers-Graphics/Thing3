package.path = "../?.lua;"..package.path;

local procfs = require("lj2procfs.procfs")
local putil = require("lj2procfs.print-util")

print("return {")
putil.printValue(procfs.cpuinfo, "    ", "cpuinfo")
print("}")
