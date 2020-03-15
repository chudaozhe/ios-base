//
//  ViewController.m
//  7uiscrollview-flash2
//
//  Created by wei cui on 2019/11/3.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"
#import "CWFlashView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CWFlashView *flashView=[CWFlashView pageView];
    flashView.imageNames=@[@"img_00", @"img_01", @"img_02", @"img_03", @"img_04"];
    flashView.frame=CGRectMake(10, 100, 300, 130);
    flashView.pageIndicatorTintColor=[UIColor redColor];
    flashView.currentPageIndicatorTintColor=[UIColor yellowColor];
    [self.view addSubview:flashView];
}


@end
