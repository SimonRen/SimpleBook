//
// Created by jmulro on 1/29/13.
//


#import <Foundation/Foundation.h>


@interface MovieObserver : NSObject {
}

+ (MovieObserver *) sharedMovieObserver;
- (id) init;
- (void) register;

- (void) onPlaybackDidFinish:(NSNotification*)notification;
- (void) onPlaybackStart:(NSNotification*)notification;

- (void) onPlayerEnterFullScreen:(NSNotification *)notification;
- (void) onPlayerExitFullScreen:(NSNotification *)notification;
@end