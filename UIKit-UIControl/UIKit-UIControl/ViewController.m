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

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self logButtonStatus];
    [_controlButton addTarget:self action:@selector(buttonTaped:) forControlEvents:UIControlEventTouchUpInside];
    
//    [_controlButton addTarget:self action:@selector(buttonDrag:withEvent:) forControlEvents:UIControlEventTouchDown];
    [_controlButton addTarget:self action:@selector(buttonDrag:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    NSArray *actionsArrary = [self getActions:_controlButton eventType:UIControlEventTouchUpInside];
    NSLog(@"actions: \n %@",actionsArrary);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method


- (void)logButtonStatus
{
    NSLog(@"button enabled = %d",_controlButton.enabled);
    NSLog(@"button selected = %d",_controlButton.selected);
    NSLog(@"button highlighted = %d",_controlButton.highlighted);
    NSLog(@"button contentVerticalAlignment = %d",_controlButton.contentVerticalAlignment);
    NSLog(@"\n");
    
}

- (void)setButtonContentVerticalAlignmentTop
{
    _controlButton.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
}

- (void)setButtonContentVerticalAlignmentFill
{
    _controlButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
}

- (NSArray *)getActions:(UIControl *)myControl eventType:(UIControlEvents)type
{
    return [myControl actionsForTarget:self forControlEvent:type];
}

- (CGPoint)onePoint:(CGPoint)p1 addAnotherPoint:(CGPoint)p2
{
    return CGPointMake(p1.x + p2.x, p1.y + p2.y);
}

- (CGPoint)deltaBetween:(CGPoint)p1 andAnotherPoint:(CGPoint)p2
{
    return CGPointMake(p1.x - p2.x, p1.y - p2.y);
}
#pragma mark - Actions

- (void)buttonTaped:(id)sender
{
    [self logButtonStatus];
    [self setButtonContentVerticalAlignmentFill];
    NSArray *actionsArrary = [self getActions:_controlButton eventType:UIControlEventTouchUpInside];
    NSLog(@"actions: \n %@",actionsArrary);
}

- (void)buttonDrag:(id)sender withEvent:(UIEvent *)event
{
    UIControl *control = sender;
    
    UITouch *t = [[event allTouches] anyObject];
    CGPoint pPrev = [t previousLocationInView:control];
    CGPoint p = [t locationInView:control];
    
    CGPoint center = control.center;
    center.x += p.x - pPrev.x;
    center.y += p.y - pPrev.y;
    control.center = center;
}
@end
