//
//  ViewController.m
//  UIKit-UIControl
//
//  Created by 王钱钧 on 14-10-8.
//  Copyright (c) 2014年 王钱钧. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIButton *controlButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self logButtonStatus];
    [_controlButton addTarget:self action:@selector(buttonTaped:) forControlEvents:UIControlEventTouchUpInside];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)logButtonStatus
{
    NSLog(@"button enabled = %d",_controlButton.enabled);
    NSLog(@"button selected = %d",_controlButton.selected);
    NSLog(@"button highlighted = %d",_controlButton.highlighted);
    NSLog(@"button contentVerticalAlignment = %d",_controlButton.contentVerticalAlignment);
    NSLog(@"\n");
    
}

- (void)buttonTaped:(id)sender
{
    [self logButtonStatus];
    [self setButtonContentVerticalAlignmentFill];
}

- (void)setButtonContentVerticalAlignmentTop
{
    _controlButton.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
}

- (void)setButtonContentVerticalAlignmentFill
{
    _controlButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
}
@end
