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
        pos = { 40, 140 },
        color = "black",
        font = "SimSun",
        fontSize = 20,
        clicked = function() print( '~~~woow~~~' ) end,
    }

    NewAnim {
        size = {30,30},
        pos = {200,200},
        fmt_images = {"wind/wind%04d.png", 1, 25},
        anim = 'auto',
        interval = 0.1,
        repeatCount = 0,
    }

end
