//
// Created by jmulro on 1/10/13.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "BlockInvocation.h"
#import "LuaBridge.h"

@implementation BlockInvocation

-(id)initWithCallbackIdx:(int)idx {
    if (self = [self init]) {
        callbackIdx = idx;
    }

    return self;
}

+(BlockInvocation *)invocationWithCallbackIdx:(int)idx {
    return [[self alloc] initWithCallbackIdx:idx];
}

-(void)perform {
    [[LuaBridge sharedLua] callLuaVI:@"CastCallback" param:callbackIdx];
}

-(void)performWithObject:(id)anObject {
    [[LuaBridge sharedLua] callLuaVI:@"CastCallback" param:callbackIdx];
}

-(void)performWithObject:(id)anObject object:(id)anotherObject {
    [[LuaBridge sharedLua] callLuaVI:@"CastCallback" param:callbackIdx];
}

@end