--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:29 PM
-- To change this template use File | Settings | File Templates.
--
local old_print = print

print = function( ... )
    if CFG.NOPRINT then return end

    old_print( ... )
end


require "system.util.color"
require "system.util.font"
require "system.util.alignment"
