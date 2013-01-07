package.path = package.path .. ';?/init.lua;../?.lua;./data/?/init.lua;./data/?.lua;'

local objc = require "objc"
setmetatable(_G, {__index=objc})

TestFo = function()
    print( "abcabc" )
end

local LuaBridge = objc.LuaBridge

LuaBridge:sharedLua():callLuaVV( NSStr("TestFo") )

