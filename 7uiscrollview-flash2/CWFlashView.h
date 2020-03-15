//
//  CWFlashView.h
//  6uiscrollview-flash
//
//  Created by wei cui on 2019/11/3.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CWFlashView : UIView<UIScrollViewDelegate>
+(instancetype)pageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
/** 指示器颜色 */
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;
/** 当前指示器颜色 */
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;

/** 定时器 */
@property (nonatomic, strong) NSTimer *timer;
/** 图片数组 */
@property (nonatomic, strong) NSArray *imageNames;
@end

NS_ASSUME_NONNULL_END
