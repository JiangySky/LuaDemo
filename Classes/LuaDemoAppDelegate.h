//
//  LuaDemoAppDelegate.h
//  LuaDemo
//
//  Created by Jiangy on 11-4-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface LuaDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *		window;
	Game *			game;
}

@property (nonatomic, retain) IBOutlet UIWindow *	window;
@property (nonatomic, retain) Game *				game;

@end

