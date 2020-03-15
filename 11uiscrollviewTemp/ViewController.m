//
//  ViewController.m
//  11uiscrollviewTemp
//
//  Created by wei cui on 2020/1/15.
//  Copyright © 2020 wei cui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** 备注 */
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建boxView
    
    CGRect frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UIView *boxView=[[UIView alloc] initWithFrame:frame];
    
    boxView.backgroundColor=[UIColor redColor];
    [self.view addSubview:boxView];
    /* 创建scrollView 并添加到self.boxView */
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, boxView.frame.size.width, boxView.frame.size.height-100)];
    self.scrollView.contentSize = CGSizeMake(boxView.frame.size.width, 1000);
    self.scrollView.backgroundColor = [UIColor blackColor];
    
    [boxView addSubview:self.scrollView];
    
    //在scrollView里添加btn
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [btn setTitle:@"bbb" forState:UIControlStateNormal];
    [self.scrollView addSubview:btn];
}


@end
