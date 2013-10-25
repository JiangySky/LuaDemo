//
//  LuaView.h
//  LuaDemo
//
//  Created by Jiangy on 11-4-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Game;


@interface LuaView : UIView {
	Game *			game;
}

@property (nonatomic, retain) Game *			game;

@end
