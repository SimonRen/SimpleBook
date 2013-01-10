//
// Created by jmulro on 1/10/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface BlockInvocation : NSObject {
    int callbackIdx;
}

-(id)initWithCallbackIdx:(int)idx;
+(BlockInvocation *)invocationWithCallbackIdx:(int)idx;

-(void)perform;
-(void)performWithObject:(id)anObject;
-(void)performWithObject:(id)anObject object:(id)anotherObject;

@end