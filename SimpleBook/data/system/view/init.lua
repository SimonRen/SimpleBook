--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:29 PM
-- To change this template use File | Settings | File Templates.
--

local DVC

ViewReset = function( view )
    DVC = view
end

ViewShow = function()
end

ViewGet = function()
    return DVC
end
