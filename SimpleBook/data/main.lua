package.path = package.path .. ';?/init.lua;../?.lua;./data/?/init.lua;./data/?.lua;'
local objc = require("objc")
for k,v in pairs(objc) do print(k,v) end



