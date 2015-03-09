//
//  NNAlertView.m
//  Pods
//
//  Created by noughts on 2015/03/09.
//
//

#import "NNAlertView.h"
#import <NBULog.h>

@implementation NNAlertView{
	NSMutableArray* _actions;
	NSMutableArray* _didDismissActions;
	id _observer;
	void (^_clickedButtonAction)();
}

-(instancetype)init{
	if (self = [super init]) {
		_actions = [NSMutableArray new];
		_didDismissActions = [NSMutableArray new];
		self.delegate = self;
		self.title = @"";
	}
	return self;
}


-(void)dealloc{
	NBULogVerbose(@"dealloc");
}


-(void)setClickedButtonAction:(void (^)(NNAlertView* alertView, NSInteger buttonIndex))action{
	_clickedButtonAction = action;
}



-(void)addButtonWithTitle:(NSString*)title action:(void (^)(void))action{
	[self addButtonWithTitle:title action:action didDismiss:nil];
}


-(void)addButtonWithTitle:(NSString *)title action:(void (^)(void))action didDismiss:(void (^)(void))didDismiss{
	[self addButtonWithTitle:title];
	if( action ){
		[_actions addObject:action];
	} else {
		[_actions addObject:[NSNull null]];
	}
	if( didDismiss ){
		[_didDismissActions addObject:didDismiss];
	} else {
		[_didDismissActions addObject:[NSNull null]];
	}
	self.cancelButtonIndex = _actions.count - 1;
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	void (^action)() = _actions[buttonIndex];
	if( action ){
		action();
	}
	
	if( _clickedButtonAction ){
		_clickedButtonAction( self, buttonIndex );
	}
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
	
}
-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
	
}
-(void)alertViewCancel:(UIAlertView *)alertView{
	
}



@end
