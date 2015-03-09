//
//  NNViewController.m
//  NNAlertView
//
//  Created by Koichi Yamamoto on 03/09/2015.
//  Copyright (c) 2014 Koichi Yamamoto. All rights reserved.
//

#import "NNViewController.h"
#import <NNAlertView.h>

@implementation NNViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NNAlertView* alert = [NNAlertView new];
	alert.message = @"message";
	[alert addButtonWithTitle:@"cancel" action:nil];
	[alert addButtonWithTitle:@"hoge" action:^{
		NSLog( @"hoge" );
	}];
	[alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
