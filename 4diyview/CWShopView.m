//
//  CWShopView.m
//  4自定义view
//
//  Created by wei cui on 2019/10/25.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "CWShopView.h"
#import "Goods.h"
@implementation CWShopView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//重写构造方法
//[[CWShopView alloc] init] init方法回自动调用initWithFrame方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor redColor];
        
        self.imgView=[[UIImageView alloc] init];
        //self.imgView.image=[UIImage imageNamed:@"danjianbao"];
        //imgView.frame=CGRectMake(0, 0, 70, 70);
        [self addSubview:self.imgView];

        self.titleView=[[UILabel alloc] init];
        //self.titleView.text=@"test";
        self.titleView.font=[UIFont systemFontOfSize:12];
        self.titleView.textAlignment=NSTextAlignmentCenter;
        //title.frame=CGRectMake(0, 70, 70, 20);

        [self addSubview:self.titleView];
    }
    
    return self;
}
/**
 布局子控件
 外面设置改view尺寸时 会自动掉这个方法
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat w=self.frame.size.width;
    CGFloat h=self.frame.size.height;
    NSLog(@"%f, %f", w, h);
    self.imgView.frame=CGRectMake(0, 0, w, w);
    self.titleView.frame=CGRectMake(0, w, w, h-w);
}
/**
 重写模型数据的 set方法
 */
-(void)setData:(Goods *)data{
    _data=data;
    self.imgView.image=[UIImage imageNamed:data.icon];
    self.titleView.text=data.name;
}
@end
