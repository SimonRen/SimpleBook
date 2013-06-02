--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:29 PM
-- To change this template use File | Settings | File Templates.
--
print = function( ... )
    if CFG.NOPRINT then return end

    local str = ''
    for _, v in ipairs({...}) do
        str = str .. tostring(v)
    end

    NSLog( NSStr(str) )

end

require "system.util.color"
require "system.util.font"
require "system.util.alignment"
require "system.util.pagepath"
require "system.util.callback"
require "system.util.style"
