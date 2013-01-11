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

--[[
-(void)playMovie
{
moviePlayer =  [[MPMoviePlayerController alloc]
                    initWithContentURL:url];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayer];

    moviePlayer.controlStyle = MPMovieControlStyleDefault;
    moviePlayer.shouldAutoplay = YES;
    moviePlayer.view.frame = self.view.bounds;
    moviePlayer.scalingMode= MPMovieScalingModeFill;
    moviePlayer.controlStyle =MPMovieControlStyleNone;
    [self.view addSubview:moviePlayer.view];
    [moviePlayer setFullscreen:YES animated:YES];
}
 ]]

NewMovie = function(param)
    local url = NSURL:fileURLWithPath( NSStr("data/book/misc/"..param.movie) )
    local player = MPMoviePlayerController:alloc():initWithContentURL( url )
    player:view().frame = CGRect( CGPoint(unpack(param.pos)), CGSize(unpack(param.size)) )
    player.controlStyle = MPMovieControlStyleDefault;
    player.fullscreen = true
    player.shouldAutoplay = false

    --[[
    local observer_done = GenCallback( function()
        if (state == MPMoviePlaybackStatePlaying) then
            if (not player:isFullscreen()) then
                print( 'to full' )
                player.fullscreen = true
            end
        elseif (state == MPMoviePlaybackStateStopped) then
            if (player:isFullscreen()) then
                print( 'stop full' )
                player.fullscreen = false
            end
        end
    end )
    local observer_done_invocate = BlockInvocation:invocationWithCallbackIdx( observer_done )
    NSNotificationCenter:defaultCenter():addObserver_selector_name_object(
        observer_done_invocate,
        SEL("performWithObject:"),
        MPMoviePlayerPlaybackDidFinishNotification,
        nil )

    local observer_start = GenCallback( function()
        if player:fullscreen() ~= true then
            player.fullscreen = true
        end
    end )
    local observer_start_invocate = BlockInvocation:invocationWithCallbackIdx( observer_start )

    NSNotificationCenter:defaultCenter():addObserver_selector_name_object(
        observer_start_invocate,
        SEL("performWithObject:"),
        MPMoviePlayerPlaybackDidFinishNotification,
        player )
    --]]

    ViewAdd( player:view() )

end
