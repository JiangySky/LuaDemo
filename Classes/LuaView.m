    //
//  LuaView.m
//  LuaDemo
//
//  Created by Jiangy on 11-4-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LuaView.h"


@implementation LuaView

@synthesize game;


- (void)dealloc {
	[super dealloc];
}


#pragma mark -
#pragma mark === touches ===
#pragma mark -

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[game touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[game touchesEnded:touches withEvent:event];	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	[game touchesMoved:touches withEvent:event];	
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	[game touchesCancelled:touches withEvent:event];	
}


#pragma mark -
#pragma mark === update ===
#pragma mark -



@end
