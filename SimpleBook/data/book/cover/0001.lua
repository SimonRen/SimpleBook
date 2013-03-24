--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:34 PM
-- To change this template use File | Settings | File Templates.
--

local done = false

MovieDone = function()
    if done then return end

    GotoPage( 'book.cover.0002' )
    done = ture
end

return function()
    NewMovie {
        size = {288,180},
        pos = {30,140},
        movie = "test.m4v",
        auto = true,
    }    
end
