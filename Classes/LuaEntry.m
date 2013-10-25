    //
//  LuaEntry.m
//  LuaDemo
//
//  Created by Jiangy on 11-4-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LuaEntry.h"
#import "LuaLibs.h"


@implementation LuaEntry

@synthesize L;
@synthesize luaString;
@synthesize haveRegistered;
@synthesize parentGame;


+ (id)luaInGame:(Game *)game withName:(NSString *)name {
	if (!name) {
		return nil;
	}
	
	LuaEntry * newEntry = [LuaEntry alloc];
	if (newEntry && [newEntry initWithName:name]) {
		newEntry.parentGame = game;
		return newEntry;
	}
	
	return nil;
}

- (id)initWithName:(NSString *)name {	
	if (self = [super init]) {
		NSString * path = [[NSBundle mainBundle] pathForResource:name ofType:@"lua"];
		NSData * data = [NSData dataWithContentsOfFile:path];
		luaString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
		L = lua_open();
		luaL_openlibs(L);
		lua_register(L, cLibs[0].name, cLibs[0].func);
		
		return self;
	}
	
	return nil;
}

- (void)dealloc {
	if (L) {
		lua_close(L);
	}
	L = nil;
	[luaString release];
	[super dealloc];
}


#pragma mark -
#pragma mark === Lua control ===
#pragma mark -

- (void)start {
	isPause = NO;
	entry = self;
	luaL_loadstring(L, [luaString UTF8String]);
	lua_resume(L, 0);
}

- (int)pause {
	isPause = YES;
	entry = nil;
	return lua_yield(L, 0);
}

- (void)resume {
	isPause = NO;
	entry = self;
	lua_resume(L, 0);
}

@end
