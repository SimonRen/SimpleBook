//
// Created by jmulro on 1/29/13.
//


#import <MediaPlayer/MediaPlayer.h>
#import "MovieObserver.h"
#import "SBRootViewController.h"
#import "LuaBridge.h"

MovieObserver *theMovieObserver = nil;

@implementation MovieObserver

+ (MovieObserver *)sharedMovieObserver {
    if (theMovieObserver == nil) {
        theMovieObserver = [[MovieObserver alloc] init];
    }

    return theMovieObserver;
}

- (id)init {
    if ((self = [super init]))
    {
    }

    return self;
}

- (void) register {
    [[NSNotificationCenter defaultCenter] addObserver:theMovieObserver
                                             selector:@selector(onPlaybackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:theMovieObserver
                                             selector:@selector(onPlaybackStart:)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:theMovieObserver
                                             selector:@selector(onPlayerEnterFullScreen:)
                                                 name:MPMoviePlayerDidEnterFullscreenNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:theMovieObserver
                                             selector:@selector(onPlayerExitFullScreen:)
                                                 name:MPMoviePlayerDidExitFullscreenNotification
                                               object:nil];
}

- (void)onPlaybackDidFinish:(NSNotification*)notification {
    int reason = [[[notification userInfo] valueForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey] intValue];
    if (reason == MPMovieFinishReasonPlaybackEnded) {
        //movie finished playing
        [[LuaBridge sharedLua] callLuaVV:@"MovieDone" ];
    }else if (reason == MPMovieFinishReasonUserExited) {
        //user hit the done button
        [[LuaBridge sharedLua] callLuaVV:@"MovieDone" ];
    }else if (reason == MPMovieFinishReasonPlaybackError) {
        //error
        [[LuaBridge sharedLua] callLuaVV:@"MovieDone" ];
    }

    MPMoviePlayerController *player = [notification object];
    [player setFullscreen:FALSE];
}

- (void)onPlaybackStart:(NSNotification*)notification {
    MPMoviePlayerController *player = [notification object];
    if ([player playbackState] == MPMoviePlaybackStatePlaying) {
        if ([player isFullscreen] == FALSE) {
            [player setFullscreen:TRUE animated:TRUE];
        }
    }
}

- (void)onPlayerEnterFullScreen:(NSNotification *)notification {
    for (UIGestureRecognizer *recognizer in [[[SBRootViewController sharedPageVC] view] gestureRecognizers]) {
        if ([recognizer isKindOfClass:[UIGestureRecognizer class]]) {
            recognizer.enabled = NO;
        }
    }
}

- (void)onPlayerExitFullScreen:(NSNotification *)notification {
    for (UIGestureRecognizer *recognizer in [[[SBRootViewController sharedPageVC] view] gestureRecognizers]) {
        if ([recognizer isKindOfClass:[UIGestureRecognizer class]]) {
            recognizer.enabled = YES;
        }
    }
}

@end