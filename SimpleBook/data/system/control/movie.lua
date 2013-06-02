--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/11/13
-- Time: 4:25 PM
--

--[[
param = {
    size = {10,20},
    pos = {10,20},
    movie = "test.mp4",
    auto = true | false
}
--]]

NewMovie = function(param)
    local url = NSURL:fileURLWithPath( NSStr("data/book/misc/"..param.movie) )
    local player = MPMoviePlayerController:alloc():initWithContentURL( url )
    player:view().frame = CGRect( CGPoint(unpack(param.pos)), CGSize(unpack(param.size)) )
    player.controlStyle = param.style or MPMovieControlStyleDefault;
    player.fullscreen = true
    player:prepareToPlay()
    player.shouldAutoplay = false

    if param.auto then
        player:play()
    end

    ViewAdd(player:view(), param.panel)
end

local player = nil


StartPlayMusic = function(path)

    StopMusic()
    local data = NSData:dataWithContentsOfFile(NSStr("data/book/misc/"..path))
    
    if (data ~= nil) then
    
        print(AVAudioPlayer)
    
        player = AVAudioPlayer:alloc()
    
        player:initWithData_error(data, nil)
    
        player:play()
    
    end

end

StopMusic = function()
    
    if player then
        player:stop()
        player = nil
    end

end

PauseMusic = function()
    if player and player.playing then
        player:pause()
    end
end

PlayMusic = function()
    if player then
        player:play()
    end
end

