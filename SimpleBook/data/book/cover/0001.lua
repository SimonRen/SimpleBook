--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:34 PM
-- To change this template use File | Settings | File Templates.
--

return function()
    NewLabel {
        text = "cover",
        size = { 200, 100 },
        pos = { 40, 40 },
        color = "black",
        font = "SimSun",
        fontSize = 20,
        clicked = function() print( '~~~woow~~~' ) end,
    }

    NewMovie {
        size = {288,180},
        pos = {30,140},
        movie = "test.m4v",
    }

end
