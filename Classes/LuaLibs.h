//
//  LuaLibs.h
//  LuaDemo
//
//  Created by Jiangy on 11-4-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LuaEntry.h"

#ifndef LUA_LIB
#define LUA_LIB

extern LuaEntry * entry;
extern luaL_Reg cLibs[];
extern luaL_Reg luaLibs[];

int registerLibs();

int startScript();
int pauseScript();
int resumeScript();

int isTouchInRect();
int sayHi();

#endif