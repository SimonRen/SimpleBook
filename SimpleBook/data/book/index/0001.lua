--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:35 PM
-- To change this template use File | Settings | File Templates.
--

return function()
    NewScrollLabel {
        text = "abcdefa",
        size = { 200, 100 },
        pos = { 40, 140 },
        color = "black",
        font = "SimSun",
        fontSize = 20,
    }

    NewAnim {
        size = {30,30},
        pos = {200,200},
        fmt_images = {"wind/wind%04d.png", 1, 25},
        anim = 'swipe',
        interval = 0.5,
        repeatCount = 0,
    }
end
