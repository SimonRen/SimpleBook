--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:34 PM
-- To change this template use File | Settings | File Templates.
--

return function()

    NewScrollLabel {
        text = "content1234567890content1234567890content1234567890content1234567890content1234567890content1234567890content1234567890content1234567890content1234567890content1234567890content1234567890",
        size = { 200, 100 },
        pos = { 40, 40 },
        color = "black",
        font = "SimSun",
        fontSize = 20,
    }

    NewAnim {
        size = {30,30},
        pos = {200,200},
        fmt_images = {"wind/wind%04d.png", 1, 25},
        anim = 'auto',
        interval = 0.5,
        repeatCount = 0,
    }

end
