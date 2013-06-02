--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:34 PM
-- To change this template use File | Settings | File Templates.
--

return function()
    local preImage = NewImage {
        image = "image 01.png",
        size = { 600, 400},
        pos = { 768/2, 1024/2 },
    }

    NewImage {
        image = "thumb 01.png",
        size = { 100, 67},
        pos = { 768/2+220, 300 },
        clicked = function()
            ChangeImage( preImage, {
                image = "image 01.png",
                size = { 600, 400},
                pos = { 768/2, 1024/2 },
            })
        end,
    }

    NewImage {
        image = "thumb 02.png",
        size = { 100, 67},
        pos = { 768/2+220, 500 },
        clicked = function()
            ChangeImage( preImage, {
                image = "image 02.png",
                size = { 600, 400},
                pos = { 768/2, 1024/2 },
            })
        end,
    }

    NewImage {
        image = "thumb 03.png",
        size = { 100, 67},
        pos = { 768/2+220, 700 },
        clicked = function()
            ChangeImage( preImage, {
                image = "image 03.png",
                size = { 600, 400},
                pos = { 768/2, 1024/2 },
            })
        end,
    }
end
