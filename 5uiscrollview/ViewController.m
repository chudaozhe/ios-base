//
//  ViewController.m
//  5uiscrollview
//
//  Created by wei cui on 2019/10/29.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"
//控制器监听scrollView
@interface ViewController () <UIScrollViewDelegate>
/** 备注 */
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView=[[UIImageView alloc] init];
    self.imageView.image=[UIImage imageNamed:@"minion"];//图片宽高：510px:510px
    self.imageView.frame=CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
    [self.scrollView addSubview:self.imageView];
    
    //禁止某个方向滚动，设为0
    self.scrollView.contentSize=self.imageView.image.size;
    //contentInset可见区域 顶部空出来64
    self.scrollView.contentOffset=CGPointMake(0, -64);//一进来y皱就空出来64
    self.scrollView.contentInset=UIEdgeInsetsMake(64, 0, 0, 0);
    //contentOffset偏移量
    NSLog(@"x=%f, y=%f", self.scrollView.contentOffset.x, self.scrollView.contentOffset.y);
    //可见区域宽高：300*310;
    NSLog(@"可见区域宽：%f, 可见区域高：%f", self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    //代理
    self.scrollView.delegate=self;
    //设置缩放比例
    self.scrollView.maximumZoomScale=2.0;
    self.scrollView.minimumZoomScale=0.2;
}
//代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSLog(@"时刻监听scrollView的滚动（可实现滚动到某个位置时调用）");
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"开始拖拽时调用");
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"结束拖拽时调用");
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"（不一定会调）减速完毕，由于惯性停止滚动时调用");
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"缩放ing...", scrollView.zoomScale);//缩放比例
}
-(IBAction)left{
    //x:0
    //y:当前偏移量
    //动画1 首尾式
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0];//2秒内完成
    [UIView setAnimationDelegate:self];//监听动画结束
    [UIView setAnimationDidStopSelector:@selector(stop)];//结束
    [UIView setAnimationWillStartSelector:@selector(start)];//开始
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];//节奏，开始慢
    self.scrollView.contentOffset=CGPointMake(0, self.scrollView.contentOffset.y);
    [UIView commitAnimations];
}
-(void)start{
    //
    NSLog(@"动画准备开始时做的事start...");
}
-(void)stop{
    NSLog(@"动画结束时做的事stop...");
}
-(IBAction)top{
    //x:当前偏移量
    //y:0
    CGPoint offset=CGPointMake(self.scrollView.contentOffset.x, 0);
    //动画2 block
    [UIView animateWithDuration:2.0 animations:^{
        self.scrollView.contentOffset=offset;
    } completion:^(BOOL finished) {
        NSLog(@"执行完毕");
    }];
    //动画3 特定
    //[self.scrollView setContentOffset:offset animated:YES];
}

-(IBAction)bottom{
    //NSLog(@"%@", NSStringFromCGPoint(self.scrollView.contentOffset));
    //x:当前偏移量
    //y:图片高度-可见区域高
    self.scrollView.contentOffset=CGPointMake(self.scrollView.contentOffset.x, self.scrollView.contentSize.height-self.scrollView.frame.size.height);
}
-(IBAction)right{
    //NSLog(@"%@", NSStringFromCGPoint(self.scrollView.contentOffset));
    //x:图片宽度-可见区域宽
    //y:当前偏移量
    self.scrollView.contentOffset=CGPointMake(self.scrollView.contentSize.width-self.scrollView.frame.size.width, self.scrollView.contentOffset.y);
}
@end
