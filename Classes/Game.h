//
//  Game.h
//  LuaDemo
//
//  Created by Jiangy on 11-4-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LuaView.h"
#import "LuaEntry.h"


@interface Game : NSObject {
	LuaView *		view;
	LuaEntry *		lua;

	UILabel *		lable;
	CGPoint			touchPostion;
}

@property (nonatomic, retain) LuaView *		view;
@property (nonatomic, retain) LuaEntry *	lua;
@property (nonatomic, retain) UILabel *		lable;
@property CGPoint		touchPostion;


+ (id)gameWithView:(LuaView *)luaView;
- (id)initWithView:(LuaView *)luaView;

- (void)start;
- (void)update;
- (void)draw;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

- (NSInteger)isTouchInRect:(CGRect)rect;

@end
