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

- (void) callLuaVV:(const char *)funcName;
- (void) callLuaVS:(const char *)funcName param:(const char *)stringParam;
- (void) callLuaVI:(const char *)funcName param:(int)intParam;

- (void) dofile:(const char *)fileName;

@end

