//
//  ViewController.m
//  6uiscrollview-flash
//
//  Created by wei cui on 2019/11/1.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"
#import "CWFlashView.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat w=self.scrollView.frame.size.width;
    CGFloat h=self.scrollView.frame.size.height;
   
    for (int i=0; i<5; i++) {
        NSLog(@"%d", i);
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.image=[UIImage imageNamed: [NSString stringWithFormat:@"img_0%d", i]];
        imageView.frame=CGRectMake(i*w, 0, w, h);
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize=CGSizeMake(5*w, h);
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.pagingEnabled=YES;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSLog(@"只要拖拽就调用");
    int page=(int)(self.scrollView.contentOffset.x/self.scrollView.frame.size.width +0.5);
    self.pageControl.currentPage=page;
    //page num=x偏移量/scrollView的宽度
   // NSLog(@"%i", page);
}


@end
