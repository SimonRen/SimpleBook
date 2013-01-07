//
// Created by jmulro on 1/7/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

#include "lua.h"

@interface LuaBridge : NSObject {
    lua_State *state;
}

@property(nonatomic,assign) lua_State *state;

+ (LuaBridge *) sharedLua;
- (LuaBridge *) init;

- (void) callLuaVV:(NSString *)funcName;
- (void) callLuaVS:(NSString *)funcName param:(NSString *)stringParam;
- (void) callLuaVI:(NSString *)funcName param:(int)intParam;

- (void) dofile:(NSString *)fileName;

@end

