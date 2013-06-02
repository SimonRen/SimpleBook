--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:34 PM
-- To change this template use File | Settings | File Templates.
--

return function()
    NewImage {
        image = "basicPage",
        size = { 768, 1024 },
        pos = { 768/2, 1024/2 },
        ---clicked = function() 
        
        ---end,
    }

    NewLabel {
        text = "Click To Jump 下一页",
        size = { 200, 100 },
        pos = { 40, 60 },
        style = "default_style",
        clicked = function()
            print('goto page')
            GotoPage('book.content.0001') 
        end,
    }

    NewMovie {
        size = {288,180},
        pos = {30,200},
        movie = "test.m4v",
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
                PauseMusic()
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
                PlayMusic()
            end,
    
    }
    
    --按钮合集
    NewButton {
        name = 'button music',
        size = {56, 55},
        pos = {0, 0},
        image = 'ButtonMusic.png',
        clicked = function()
            StartPlayMusic("youreye.mp3")
        end
    
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
    
    NewButton {
        size = {108, 109},
        pos = {55+72+72, 0},
        image = 'buttonD1Gallery.png',
        clicked = function() NewPhotoBrowser {
                        images = {"car_002_1.jpg", "car_002_2.jpg", "car_002_3.jpg", "car_002_4.jpg"},
                    } end,
    }
    
    NewButton {
        size = {108, 109},
        pos = {55+72+72+108, 0},
        image = 'buttonD2Movie.png',
        clicked = function() 
            NewMovie {
                size = {288,180},
                pos = {30,140},
                movie = "video 01.mp4",
                auto = true,
                style = MPMovieControlStyleDefault,
            }  
        
        end
    }
    
    NewButton {
        size = {109, 109},
        pos = {55+72+72+108 + 108, 0},
        image = 'buttonB5Step.png',
        clicked = function() 
                
                  end,
    }
    
    NewButton {
        size = {108, 107},
        pos = {55+72+72+108+108+109, 0},
        image = 'buttonVoice_a.png',
        selected_image = 'buttonVoice_b.png',
    
        clicked = function(button)
                     print(button:isSelected())
                     button:setSelected(not (button:isSelected() == 1))
                     
                     if (button:isSelected() == 1) then
                        --亮起来了
                        PlayMusic()
                     else
                        PauseMusic()
                     end
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
                    pos = {(768-626)/2, (1024-786)/2},
                    size = {626, 786},
                    rsize = {626, 786*2},
                }
                
                NewImage {
                    image = 'subPageB',
                    size = {626, 786},
                    panel = _panel,
                    pos = {626/2, 786/2},
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
                    image = "buttonD1Gallery.png",
                    size = { 108, 109 },
                    pos = { 40, 1000 },
                    panel = _panel,
                    clicked = function() NewPhotoBrowser {
                        images = {"car_002_1.jpg", "car_002_2.jpg", "car_002_3.jpg", "car_002_4.jpg"},
                    } end,
                }
    end,
    
}
 
end
