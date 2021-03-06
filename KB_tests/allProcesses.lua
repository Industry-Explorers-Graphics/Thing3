local procfs = require("lj2procfs.procfs")
local fun = require("lj2procfs.fun")
local putil = require("lj2procfs.print-util")


local function printProcEntry(procEntry)
    print(string.format("\t[%d] = {", procEntry.Id))

    for _, fileEntry in procEntry:files() do
        local fileValue = procEntry[fileEntry.Name]
        putil.printValue(fileValue, '\t\t', fileEntry.Name)
    end

    print(string.format("\t},"))
end


print(string.format("return {"))
fun.each(printProcEntry, procfs.processes())
print(string.format("}"))
