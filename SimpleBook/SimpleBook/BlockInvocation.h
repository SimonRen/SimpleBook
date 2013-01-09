//
// Created by jmulro on 1/10/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface BlockInvocation : NSObject {
    void *block;
}

-(id)initWithBlock:(void *)aBlock;
+(BlockInvocation *)invocationWithBlock:(void *)aBlock;

-(void)perform;
-(void)performWithObject:(id)anObject;
-(void)performWithObject:(id)anObject object:(id)anotherObject;

@end