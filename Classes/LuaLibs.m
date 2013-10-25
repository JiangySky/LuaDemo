    //
//  LuaLibs.m
//  LuaDemo
//
//  Created by Jiangy on 11-4-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LuaLibs.h"
#import "LuaEntry.h"
#import "Game.h"

#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))

LuaEntry * entry = nil;

#pragma mark === C Function list ===

luaL_Reg cLibs[] = {
	{"registerLibs", registerLibs},
	{"startScript", startScript},
	{"pauseScript", pauseScript},
	{"resumeScript", resumeScript},
	{"isTouchInRect", isTouchInRect},
	{"sayHi", sayHi},
};


#pragma mark === lua Function list ===

luaL_Reg luaLibs[] = {
	
};


#pragma mark -
#pragma mark === C Function implement ===
#pragma mark -

int registerLibs() {
	if (![entry haveRegistered]) {
		NSString * libsNeedReg = [NSString stringWithUTF8String:lua_tostring(entry.L, 1)];		
		int libsSize = ARRAY_SIZE(cLibs);
		for (int i = 1; i < libsSize; i++) {
			NSString * fName = [NSString stringWithUTF8String:cLibs[i].name];
			NSRange range = [libsNeedReg rangeOfString:fName];
			if (range.location != NSNotFound) {
				lua_register(entry.L, cLibs[i].name, cLibs[i].func);
			}
		}
		
		[entry setHaveRegistered:YES];
	}	
	
	return 0;
}

int startScript() {
	[entry start];
	return 0;
}

int pauseScript() {
	[entry pause];
	return 0;
}

int resumeScript() {
	[entry resume];
	return 0;
}

int isTouchInRect() {	
	float x = lua_tonumber(entry.L, 1);
	float y = lua_tonumber(entry.L, 2);
	float w = lua_tonumber(entry.L, 3);
	float h = lua_tonumber(entry.L, 4);
	CGRect rect = CGRectMake(x, y, w, h);
	NSInteger result = [entry.parentGame isTouchInRect:rect];
	entry.parentGame.touchPostion = CGPointZero;
	lua_pushboolean(entry.L, result);
		
	return 1;
}

int sayHi() {
	UIAlertView * hi = [[UIAlertView alloc] initWithTitle:nil 
												  message:@"Hey, guy."
												 delegate:nil 
										cancelButtonTitle:@"Hi" 
										otherButtonTitles:nil];
	[hi show];
	[hi release];
	
	return 0;
}


#pragma mark -
#pragma mark === lua Function implement ===
#pragma mark -


