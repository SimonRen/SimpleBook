//
// Created by jmulro on 1/7/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "LuaBridge.h"

#include "lualib.h"
#include "lauxlib.h"

LuaBridge *theLuaBridge = nil;

@implementation LuaBridge

@synthesize state;

- (LuaBridge *)init {
    if ((self = [super init]))
    {
        state = luaL_newstate();
        luaL_openlibs( state );

        NSString *workpath = [[NSBundle mainBundle] bundlePath];
        chdir( [workpath cStringUsingEncoding:NSASCIIStringEncoding] );
    }

    return self;
}

- (void)callLuaVV:(NSString *)funcName {
    int top = lua_gettop( state );

    lua_getglobal( state, "debug" );
    lua_getfield( state, -1, "traceback" );

    lua_getglobal( state, [funcName cStringUsingEncoding:NSASCIIStringEncoding] );

    if (lua_pcall(state, 0, 0, -2) != 0)
    {
        const char *msg = lua_tostring( state, -1 );
        printf( "%s\n", msg );
    }

    lua_settop( state, top );
}

- (void)callLuaVS:(NSString *)funcName param:(NSString *)stringParam {
    int top = lua_gettop( state );

    lua_getglobal( state, "debug" );
    lua_getfield( state, -1, "traceback" );

    lua_getglobal( state, [funcName cStringUsingEncoding:NSASCIIStringEncoding] );
    lua_pushstring( state, [stringParam cStringUsingEncoding:NSASCIIStringEncoding] );

    if (lua_pcall(state, 1, 0, -3) != 0)
    {
        const char *msg = lua_tostring( state, -1 );
        printf( "%s\n", msg );
    }

    lua_settop( state, top );
}

- (void)callLuaVI:(NSString *)funcName param:(int)intParam {
    int top = lua_gettop( state );

    lua_getglobal( state, "debug" );
    lua_getfield( state, -1, "traceback" );

    lua_getglobal( state, [funcName cStringUsingEncoding:NSASCIIStringEncoding] );
    lua_pushinteger( state, intParam );

    if (lua_pcall(state, 1, 0, -3) != 0)
    {
        const char *msg = lua_tostring( state, -1 );
        printf( "%s\n", msg );
    }

    lua_settop( state, top );
}

- (void)dofile:(NSString *)fileName {
    int ret = luaL_dofile(state, [fileName cStringUsingEncoding:NSASCIIStringEncoding]);
    if (ret != 0)
    {
        printf( "%s\n", lua_tostring(state, -1) );
    }
}

+ (LuaBridge *) sharedLua {
    if (theLuaBridge == nil)
    {
        theLuaBridge = [[LuaBridge alloc] init];
    }

    return theLuaBridge;
}

@end
