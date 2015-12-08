local ffi = require("ffi")

require("lj2procfs.platform")

-- dirent.h
ffi.cdef[[
	typedef off_t off64_t;
	typedef ino_t ino64_t;
]]

ffi.cdef[[
char *strchr (const char *, int);
]]



local exports = {}
setmetatable(exports, {
	__index = function(self, key)
		local value = nil;
		local success = false;

--[[
		-- try looking in table of constants
		value = C[key]
		if value then
			rawset(self, key, value)
			return value;
		end
--]]

		-- try looking in the ffi.C namespace, for constants
		-- and enums
		success, value = pcall(function() return ffi.C[key] end)
		--print("looking for constant/enum: ", key, success, value)
		if success then
			rawset(self, key, value);
			return value;
		end

		-- Or maybe it's a type
		success, value = pcall(function() return ffi.typeof(key) end)
		if success then
			rawset(self, key, value);
			return value;
		end

		return nil;
	end,
})

return exports
