--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:34 PM
-- To change this template use File | Settings | File Templates.
--

return function()
        --按钮合集
    NewButton {
        name = 'button music',
        size = {56, 55},
        pos = {0, 0},
        image = 'ButtonMusic.png',
    
    }
    
    NewButton {
        size = {72, 62},
        pos = {55, 0},
        image='buttonPrep.png',
        clicked = function ()
            GotoPagePre()
        end
    }
    
    NewButton {
        size = {72, 62},
        pos = {55+72, 0},
        image='buttonNext.png',
        clicked = function ()
            GotoPageNext()
        end
    }

    NewScrollLabel {
        text = "content1234567890content1234567890content1234567890content1234567890content1234567890content1234567890content1234567890content1234567890content1234567890content1234567890content1234567890",
        size = { 200, 100 },
        pos = { 40, 80 },
        color = "black",
        font = "SimSun",
        fontSize = 20,
    }

    NewAnim {
        size = {30,30},
        pos = {200,400},

        fmt_images = {"niu/BFinal Color Output%04d.png", 1, 36},
        anim = 'auto',
        interval = 0.5,
        repeatCount = 0,
    }

end
