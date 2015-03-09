//
//  NNAlertView.h
//  Pods
//
//  Created by noughts on 2015/03/09.
//
//

#import <UIKit/UIKit.h>

@interface NNAlertView : UIAlertView <UIAlertViewDelegate>

-(void)addButtonWithTitle:(NSString*)title action:(void (^)(void))action;

@end
