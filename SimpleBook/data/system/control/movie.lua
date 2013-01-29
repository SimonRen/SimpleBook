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
}
--]]

NewMovie = function(param)
    local url = NSURL:fileURLWithPath( NSStr("data/book/misc/"..param.movie) )
    local player = MPMoviePlayerController:alloc():initWithContentURL( url )
    player:view().frame = CGRect( CGPoint(unpack(param.pos)), CGSize(unpack(param.size)) )
    player.controlStyle = MPMovieControlStyleDefault;
    player.fullscreen = true
    player.shouldAutoplay = false

    ViewAdd( player:view() )
end
