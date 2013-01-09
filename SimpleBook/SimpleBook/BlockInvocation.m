//
// Created by jmulro on 1/10/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BlockInvocation.h"


@implementation BlockInvocation

-(id)initWithBlock:(void *)aBlock {
    if (self = [self init]) {
        block = (__bridge void *)[(__bridge void (^)(void))aBlock copy];
    }

    return self;
}

+(BlockInvocation *)invocationWithBlock:(void *)aBlock {
    return [[self alloc] initWithBlock:aBlock];
}

-(void)perform {
    ((__bridge void (^)(void))block)();
}

-(void)performWithObject:(id)anObject {
    ((__bridge void (^)(id arg1))block)(anObject);
}

-(void)performWithObject:(id)anObject object:(id)anotherObject {
    ((__bridge void (^)(id arg1, id arg2))block)(anObject, anotherObject);
}

@end