--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:34 PM
-- To change this template use File | Settings | File Templates.
--

return function()
    NewLabel {
        text = "cover, 点击可跳到下一页",
        size = { 200, 100 },
        pos = { 40, 40 },
        color = "black",
        font = "SimSun",
        fontSize = 20,
        clicked = function() PageGoto(2) end,
    }

    NewMovie {
        size = {288,180},
        pos = {30,140},
        movie = "test.m4v",
    }
    
    NewButton {
        image = "click_to_play.png",
        size = { 200, 100 },
        pos = { 40, 600 },
        clicked = function() NewPhotoBrowser {
            images = {"photo1l.jpg", "photo2l.jpg", "photo3l.jpg", "photo4l.jpg"},
        } end,
    }
    
    NewLabel {
            text = "点击访问百度",
            size = { 200, 100 },
            pos = { 300, 600 },
            color = "black",
            font = "SimSun",
            fontSize = 20,
            clicked = function()
                print('click')
                OpenUrl("http://www.baidu.com")
            end,
    
    }
    
    NewLabel {
            text = "点击放音乐",
            size = { 200, 100 },
            pos = { 300, 640 },
            color = "black",
            font = "SimSun",
            fontSize = 20,
            panel = _panel,
            clicked = function()
                print('click')
                StartPlayMusic("youreye.mp3")
            end,
    
    }
    
     NewLabel {
            text = "暂停播放音乐",
            size = { 200, 100 },
            pos = { 300, 800 },
            color = "black",
            font = "SimSun",
            fontSize = 20,
            panel = _panel,
            clicked = function()
                print('click')
                PauseMusic("youreye.mp3")
            end,
    
    }
    
    NewLabel {
            text = "继续播放音乐",
            size = { 200, 100 },
            pos = { 100, 800 },
            color = "black",
            font = "SimSun",
            fontSize = 20,
            panel = _panel,
            clicked = function()
                print('click')
                PlayMusic("youreye.mp3")
            end,
    
    }
    
    NewLabel {
            text = "点击打开panel",
            size = { 200, 100 },
            pos = { 500, 600 },
            color = "black",
            font = "SimSun",
            fontSize = 20,
            clicked = function()
                local _panel = NewPanel {
    
                }
                
    

        NewLabel {
            text = "点击访问百度",
            size = { 200, 100 },
            pos = { 300, 600 },
            color = "black",
            font = "SimSun",
            fontSize = 20,
            panel = _panel,
            clicked = function()
                print('click')
                OpenUrl("http://www.baidu.com")
            end,
    
    }
    
    NewButton {
        image = "click_to_play.png",
        size = { 200, 100 },
        pos = { 40, 600 },
        panel = _panel,
        clicked = function() NewPhotoBrowser {
            images = {"photo1l.jpg", "photo2l.jpg", "photo3l.jpg", "photo4l.jpg"},
        } end,
    }



            end,
    
    }

    
    
end
