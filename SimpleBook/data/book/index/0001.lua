--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:35 PM
-- To change this template use File | Settings | File Templates.
--

return function()
    NewButton {
        size = {80,40},
        pos = {120,130},
        image = "test.png",
        clicked = function() GotoPage( "book.cover.0001" ) end,
    }

    NewAnim {
        size = {30,30},
        pos = {200,200},
        fmt_images = {"wind/wind%04d.png", 1, 25},
        anim = 'swipe',
        interval = 0.1,
        repeatCount = 0,
    }
end
