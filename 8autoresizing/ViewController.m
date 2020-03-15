//
//  ViewController.m
//  8autoresizing
//
//  Created by wei cui on 2019/11/7.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn=[[UIButton alloc]init];
    btn.backgroundColor=[UIColor blueColor];
    CGFloat wh=100;
    CGFloat x=0;
    CGFloat y=0;
    btn.frame=CGRectMake(x, y, wh, wh);
    //固定在左上角
    //btn.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:btn];
    /*
     · UIViewAutoresizingNone                 = 0,
       UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
       UIViewAutoresizingFlexibleWidth        = 1 << 1,
       UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
       UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
       UIViewAutoresizingFlexibleHeight       = 1 << 4,
       UIViewAutoresizingFlexibleBottomMargin = 1 << 5
     UIViewAutoresizingNone                   不自动调整。
     UIViewAutoresizingFlexibleLeftMargin     自动调整view与父视图左边距，以保证右边距不变
     UIViewAutoresizingFlexibleWidth          自动调整view的宽度，保证左边距和右边距不变
     UIViewAutoresizingFlexibleRightMargin    自动调整view与父视图右边距，以保证左边距不变
     UIViewAutoresizingFlexibleTopMargin      自动调整view与父视图上边距，以保证下边距不变
     UIViewAutoresizingFlexibleHeight         自动调整view的高度，以保证上边距和下边距不变
     UIViewAutoresizingFlexibleBottomMargin   自动调整view与父视图下边距，以保证上边距不变
     */
}


@end
