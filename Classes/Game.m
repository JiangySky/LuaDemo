//
//  Game.m
//  LuaDemo
//
//  Created by Jiangy on 11-4-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "LuaView.h"


@implementation Game

@synthesize view;
@synthesize lua;
@synthesize lable;
@synthesize touchPostion;

+ (id)gameWithView:(LuaView *)luaView {
	if (!luaView) {
		return nil;
	}
	
	Game * newGame = [Game alloc];
	if (newGame && [newGame initWithView:luaView]) {
		return [newGame autorelease];
	}
	[newGame release];
	
	return nil;
}

- (id)initWithView:(LuaView *)luaView {
	if (!luaView) {
		return nil;
	}
	
	if (self = [super init]) {
		view = luaView;
		view.game = self;
		touchPostion = CGPointZero;
		
		NSString * luaFile = [NSString stringWithFormat:@"test"];
		lua = [LuaEntry luaInGame:self withName:luaFile];
	}
	
	return self;
}

- (void)dealloc {
	[lua release];	
    [super dealloc];
}

- (void)start {
	[NSTimer scheduledTimerWithTimeInterval:0.2f 
									 target:self 
								   selector:@selector(update) 
								   userInfo:nil 
									repeats:YES];
	
	[self update];
}


#pragma mark -
#pragma mark === update ===
#pragma mark -

- (void)update {
	[self draw];
	[lua start];
}

- (void)draw {
	if (!lable) {
		lable = [[UILabel alloc] initWithFrame:CGRectMake(110, 50, 100, 50)];
		[lable setBackgroundColor:[UIColor colorWithRed:0.3f green:0.5f blue:0.2f alpha:0.6f]];
		[lable setText:@"Say Hi"];
		[lable setTextAlignment:UITextAlignmentCenter];
		
		[view addSubview:lable];
	}
	
	
}


#pragma mark -
#pragma mark === touches ===
#pragma mark -

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch * touch = [touches anyObject];
	touchPostion = [touch locationInView:view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	
}

- (NSInteger)isTouchInRect:(CGRect)rect {
	if (CGRectContainsPoint(rect, touchPostion)) {
		return 1;
	}
	
	return 0;
}


@end
