//
//  ViewController.m
//  3代码创建按钮(一个实例)
//
//  Created by wei cui on 2019/10/22.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"
#import "Goods.h"
#import <MJExtension/MJExtension.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopView;
/** 商品数据 */
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) UIView *hub;
@end

@implementation ViewController
-(NSMutableArray *)data{
    if (_data==nil) {
        NSBundle *bundle=[NSBundle mainBundle];
        NSString *filepath=[bundle pathForResource:@"shops" ofType:@"plist"];
        //NSLog(@"bundle:%@", filepath);
        NSArray *dict=[NSArray arrayWithContentsOfFile:filepath];
        NSLog(@"data:%@", dict);
        _data=[Goods mj_objectArrayWithKeyValuesArray:dict];
//        for (Goods *item in _data) {
//          NSLog(@"name=%@, height=%@", item.name, item.icon);
//        }
    }
    return _data;
}
- (IBAction)right:(id)sender {
}
- (IBAction)bottom:(id)sender {
}
- (IBAction)top:(id)sender {
}
- (IBAction)left:(id)sender {
}
-(void)addButton:(NSString *) image highlighted:(NSString *)highimg disabledimg:(NSString *)disabledimg frame:(CGRect)frame tag:(NSInteger)tag target:(SEL)action{
    //UIButton *addButton=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *addButton=[[UIButton alloc] init];//等价于上一行UIButtonTypeCustom
    [addButton setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [addButton setBackgroundImage:[UIImage imageNamed:highimg] forState:UIControlStateHighlighted];
    [addButton setBackgroundImage:[UIImage imageNamed:disabledimg] forState:UIControlStateDisabled];
    addButton.frame=frame;
    [addButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    addButton.tag=tag;
    [self.view addSubview:addButton];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //通过代码创建按钮
    //1add按钮
    //[self addButton:@"add" highlighted:@"add_highlighted" disabledimg:@"add_disabled" frame:CGRectMake(100, 200, 50, 50) tag:100 target:@selector(Click:)];
    //2remove按钮
    //[self addButton:@"remove" highlighted:@"remove_highlighted" disabledimg:@"remove_disabled" frame:CGRectMake(200, 200, 50, 50) tag:200 target:@selector(Click:)];
}
- (IBAction)Click:(UIButton *)sender {
    //[self createAlter];//弹窗
    //已添加子控件的总数
    NSInteger sub_count=self.shopView.subviews.count;
    if (sender.tag==10) {
        //if (sub_count>=30) sender.enabled=NO;
        //NSLog(@"add");
        if (sub_count<self.data.count) {
            [self addSubView];
        }else NSLog(@"没了");
        
        //[self addSubView:CGRectMake(0, 0, 70, 90) image:@"danjianbao" name:@"单肩包"];
        //[self addSubView:CGRectMake(80, 0, 70, 90) image:@"liantiaobao" name:@"链条包"];
    }else {
        NSLog(@"remove");
        //控制按钮状态
        //if (sub_count==0) sender.enabled=NO;
        [self.shopView.subviews[sub_count-1] removeFromSuperview];
    }
    
}
-(void)addSubView{
   
    //self.shopView.clipsToBounds=YES;
    //已添加子控件的总数
    NSInteger sub_count=self.shopView.subviews.count;
    NSInteger col=5;//几列
    NSInteger box_w=70;
    NSInteger box_h=90;
    NSInteger shop_view_width=self.shopView.frame.size.width;
    NSInteger jx=(shop_view_width-box_w*col)/(col-1);
    NSLog(@"%zd, %f", shop_view_width, self.shopView.frame.size.height);
    
    UIView *sview=[[UIView alloc] init];
    sview.backgroundColor=[UIColor redColor];
    CGFloat box_x=(sub_count % col) * (box_w + jx);
    NSInteger row = (int)(sub_count / col);//列号 0开始;
    CGFloat box_y = row * (box_h + 10);
    sview.frame=CGRectMake(box_x, box_y, 70, 90);
    Goods *good=self.data[sub_count];
    NSLog(@"count:%zd", sub_count);
   
    UIImageView *imgView=[[UIImageView alloc] init];
    imgView.image=[UIImage imageNamed:good.icon];
    imgView.frame=CGRectMake(0, 0, 70, 70);
    UILabel *title=[[UILabel alloc] init];
    title.text=good.name;
    title.font=[UIFont systemFontOfSize:12];
    title.textAlignment=NSTextAlignmentCenter;
    title.frame=CGRectMake(0, 70, 70, 20);
    [sview addSubview:imgView];
    [sview addSubview:title];
    [self.shopView addSubview:sview];
}
-(void)createAlter{
    
    self.hub=[[UIView alloc] init];
    self.hub.frame=CGRectMake(20, 300, 300, 60);
    UIColor *color= [UIColor colorWithRed:1/123 green:1/23 blue:1/233 alpha:0.2];;
    self.hub.backgroundColor=color;
    //hub.alpha=0.2;//透明度
    //hub.hidden=YES;//隐藏
    
    UILabel *hub_txt=[[UILabel alloc] init];
    hub_txt.frame=CGRectMake(0, 0, 200, 30);
    hub_txt.text=@"haha";
    hub_txt.textAlignment=NSTextAlignmentCenter;
    [self.hub addSubview:hub_txt];
    [self.view insertSubview:self.hub aboveSubview:_shopView];
    //1, 2秒以后调用hideAlter
    //[self performSelector:@selector(hideAlter:) withObject:@"123" afterDelay:2];
    //2,
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hub.alpha=0;
    });
    //3,
    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(hideAlter:) userInfo:@"123" repeats:NO];
}
//隐藏弹窗
-(void)hideAlter:(NSString *)test{
    NSLog(@"hide");
    self.hub.alpha=0;
}
@end
