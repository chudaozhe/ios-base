//
//  ViewController.m
//  10autolayout-code
//
//  Created by wei cui on 2019/11/10.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"
#define MAS_SHORTHAND //定义这个宏就不用加mas_前缀
//#define MAS_SHORTHAND_GLOBALS //自动包装
#import <Masonry/Masonry.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *redView=[[UIView alloc] init];
    redView.backgroundColor=[UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blackView=[[UIView alloc] init];
    blackView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:blackView];
    //添加约束
    CGFloat margin=20;
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        /*
        make.size.mas_equalTo(CGSizeMake(100, 100));
        //宽高都乘以父控件宽高的0.5-100
        //make.size.equalTo(self.view).multipliedBy(0.5).offset(-100);
        //右边与父控制器对齐
        make.right.equalTo(self.view.mas_right).offset(-20);//距离父控制器右边20
        //底部与父控制器对齐
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
         */
        //水平+垂直都剧中
        //尺寸是父控件的一半
        /*
        make.size.equalTo(self.view).multipliedBy(0.5);
        make.center.equalTo(self.view);
        //make.centerX.mas_equalTo(self.view);
        //make.centerY.mas_equalTo(self.view);
        */
        //距离父控件四周都是50，注意right,bottom是负数
        /*
        //make.left.top.equalTo(self.view).offset(50);
        //make.right.bottom.equalTo(self.view).offset(-50);
        //它的边缘=等于父控件的边缘，内边距各50
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, 50, 50));
        //它的边缘=等于父控件的边缘，无内边距
        //make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsZero);
         */
        
        
        make.height.equalTo(@50);
        make.width.equalTo(blackView.mas_width);
        //注意right,bottom是负数
        make.left.equalTo(self.view.mas_left).offset(margin);
        make.top.equalTo(blackView.mas_top);
        make.right.equalTo(blackView.mas_left).offset(-margin);
        make.bottom.equalTo(self.view.mas_bottom).offset(-margin);
        make.bottom.equalTo(blackView.mas_bottom);
        
        
        //约束的类型（用make能点出来的）
        //1.尺寸：width/height/size
        //2.边界：left/leading/right/trailing/top/bottom
        //3.中心点：center/centerX/centerY
        //4.边界：edges
    }];
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-margin);
    }];
}
-(void)test1
{
    // Do any additional setup after loading the view.
       UIView *redView=[[UIView alloc] init];
       redView.backgroundColor=[UIColor redColor];
       //redView.frame=CGRectMake(0, 0, 100, 100);
       
       //不要将AutoresizingMask转为autolayout的约束
       redView.translatesAutoresizingMaskIntoConstraints=NO;
       [self.view addSubview:redView];
    //添加宽度约束
    NSLayoutConstraint *constraint_w=[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:100];
    [redView addConstraint:constraint_w];
    //添加高度约束
    NSLayoutConstraint *constraint_h=[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:100];
    [redView addConstraint:constraint_h];
    
    //水平居中
    //redView的中间=父控件的中间，并偏移0*1
    NSLayoutConstraint *constraint_c=[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    [self.view addConstraint:constraint_c];
    
    //下边约束,距离父控件底部 10
    //redView的底部=父控件的底部，并向上便宜10*1
    NSLayoutConstraint *constraint_b=[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
    [self.view addConstraint:constraint_b];

}

@end
