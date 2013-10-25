//
//  LuaEntry.h
//  LuaDemo
//
//  Created by Jiangy on 11-4-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lua.h"
#import "lualib.h"
#import "lauxlib.h"

@class Game;

@interface LuaEntry : NSObject {
	Game *			parentGame;
	
	lua_State *		L;
	NSString *		luaString;
	BOOL			isPause;
	BOOL			haveRegistered;
}

@property (nonatomic, retain) Game *		parentGame;
@property (nonatomic, retain) NSString *	luaString;
@property (readonly) lua_State *			L;
@property BOOL		haveRegistered;

+ (id)luaInGame:(Game *)game withName:(NSString *)name;
- (id)initWithName:(NSString *)name;

- (void)start;
- (int)pause;
- (void)resume;

@end
