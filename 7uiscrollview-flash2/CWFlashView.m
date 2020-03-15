//
//  CWFlashView.m
//  6uiscrollview-flash
//
//  Created by wei cui on 2019/11/3.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "CWFlashView.h"
@implementation CWFlashView

+(instancetype)pageView{
    NSLog(@"当前类名：%@", NSStringFromClass(self));
    CWFlashView *pageView=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
    //pageView.data=data;
    return pageView;
}
-(void)setImageNames:(NSArray *)imageNames{
    _imageNames=imageNames;
    //移除所有子view imageView
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i=0; i<_imageNames.count; i++) {
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.image=[UIImage imageNamed: _imageNames[i]];
        
        [self.scrollView addSubview:imageView];
    }
    self.pageControl.currentPage=0;
    self.pageControl.numberOfPages=_imageNames.count;
    //只有一张图片时隐藏 指示器
    //self.pageControl.hidesForSinglePage=YES;
    //[self startTimer];//默认开启定时器
}
/**
 指示器颜色
 */
- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor
{
    self.pageControl.pageIndicatorTintColor=pageIndicatorTintColor;
}
/**
 当前指示器颜色
 */
- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor
{
    self.pageControl.currentPageIndicatorTintColor=currentPageIndicatorTintColor;
}
/**
 设置子控件
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    
    //1.scrollView尺寸
    self.scrollView.frame=self.bounds;
    CGFloat w=self.scrollView.frame.size.width;
    CGFloat h=self.scrollView.frame.size.height;
    
    //2.光标位置尺寸
    CGFloat pw=100;
    CGFloat ph=20;
    CGFloat px=w-pw;
    CGFloat py=h-ph;
    NSLog(@"ww:%f hh:%f", w, h);
    NSLog(@"px:%f py:%f", px, py);
    self.pageControl.frame=CGRectMake(px, py, pw, ph);
    
    //3.设置每个imageView的frame;
    for (int i=0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imageView=self.scrollView.subviews[i];
        imageView.frame=CGRectMake(i*w, 0, w, h);
        NSLog(@"com in");
    }
    //设置内容大小
    NSLog(@"contentSize:%f", _imageNames.count*w);
    self.scrollView.contentSize=CGSizeMake(_imageNames.count*w, 0);
}
/**
 设置光标跟随
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page=(int)(self.scrollView.contentOffset.x/self.scrollView.frame.size.width +0.5);
    self.pageControl.currentPage=page;
}
//定时器
//手指按下，停止定时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"手指按下");
    [self stopTimer];
}
//手指松开，开始定时器
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"手指松开");
    [self startTimer];
}
//开始定时器
-(void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    //textView,确保 拖拽textView时 flash timer不停
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
//结束定时器
-(void)stopTimer
{
    [self.timer invalidate];
    self.timer=nil;
}
//被定时器调用，跳到下一页
-(void)nextPage
{
    //NSLog(@"nextPage");
    NSInteger page=self.pageControl.currentPage+1;//下一页
    if(page==self.pageControl.numberOfPages){
        page=0;//跳到最后一页时，拉回第一页
    }
    CGPoint offset=self.scrollView.contentOffset;
    offset.x=page*self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:offset animated:YES];
}
@end
