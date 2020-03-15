//
//  ViewController.m
//  2父子控件
//
//  Created by wei cui on 2019/10/21.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *uview;
@property (weak, nonatomic) IBOutlet UILabel *ulabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"uview的父控件%@", self.uview.superview);
    NSLog(@"uview的子控件%@", self.uview.subviews);
}

- (IBAction)addView:(id)sender {
    UISwitch *s=[[UISwitch alloc] init];
    UISlider *slider=[[UISlider alloc] init];
    [self.uview addSubview:slider];
    [self.uview insertSubview:s aboveSubview:slider];//上面
    //[self.uview insertSubview:s belowSubview:slider];//下面
}
- (IBAction)rmView:(id)sender {
    
    [self.ulabel removeFromSuperview];
    [[self.view viewWithTag:111] removeFromSuperview];
}
- (IBAction)addViewWithFrame:(id)sender {
    NSLog(@"x=%f,y=%f,w=%f,h=%f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    NSLog(@"x=0, y=0,%f,%f", self.view.bounds.size.width, self.view.bounds.size.height);
    CGRect rect=CGRectMake(10, 10, 200, 200);
    UILabel *label=[[UILabel alloc] initWithFrame:rect];
    label.backgroundColor=[UIColor redColor];
    [self.uview addSubview:label];//父控件uview的左上角为原点坐标
    NSLog(@"xx");
}
@end
