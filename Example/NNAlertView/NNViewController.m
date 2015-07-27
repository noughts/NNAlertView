//
//  NNViewController.m
//  NNAlertView
//
//  Created by Koichi Yamamoto on 03/09/2015.
//  Copyright (c) 2014 Koichi Yamamoto. All rights reserved.
//

#import "NNViewController.h"
#import <NNAlertView.h>
#import <NBULog.h>


@implementation NNViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	

}


-(IBAction)hoge:(id)sender{
	NNAlertView* alert = [NNAlertView new];
	alert.message = @"message";
	[alert addButtonWithTitle:@"cancel"];
	[alert addButtonWithTitle:@"hoge" action:^{
		NBULogInfo( @"hoge" );
	}];
	[alert setClickedButtonAction:^(NNAlertView *alertView, NSInteger buttonIndex) {
		NSString* title = [alertView buttonTitleAtIndex:buttonIndex];
		NBULogInfo( @"%@番目のボタンをクリックしました。title=%@", @(buttonIndex), title );
	}];
	[alert show];
}

-(IBAction)fuga:(id)sender{
	NNAlertView* alert = [NNAlertView new];
	alert.message = @"message";
	[alert addButtonWithTitle:@"cancel"];
	[alert addButtonWithTitle:@"hoge"];
	[alert setClickedButtonAction:^(NNAlertView *alertView, NSInteger buttonIndex) {
		NSString* title = [alertView buttonTitleAtIndex:buttonIndex];
		NBULogInfo( @"%@番目のボタンをクリックしました。title=%@", @(buttonIndex), title );
	}];
	[alert show];
}


@end
