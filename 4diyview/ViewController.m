//
//  ViewController.m
//  4自定义view
//
//  Created by wei cui on 2019/10/25.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"
#import "CWShopView2.h"
#import "Goods.h"
#import <MJExtension/MJExtension.h>
@interface ViewController ()
/** 备注 */
@property (nonatomic, strong) NSMutableArray *goods;
@end

@implementation ViewController
-(NSMutableArray *)goods{
    if (_goods==nil) {
          NSBundle *bundle=[NSBundle mainBundle];
          NSString *filepath=[bundle pathForResource:@"shops" ofType:@"plist"];
          //NSLog(@"bundle:%@", filepath);
          NSArray *dict=[NSArray arrayWithContentsOfFile:filepath];
          _goods=[Goods mj_objectArrayWithKeyValuesArray:dict];
//          for (Goods *item in _goods) {
//             NSLog(@"name=%@, height=%@", item.name, item.icon);
//          }
    }
    return _goods;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /** 方式1
    CWShopView *s=[[CWShopView alloc] init];
    [s setData:self.goods[0]];
    s.frame=CGRectMake(0, 100, 70, 90);
    [self.view addSubview:s];
         */
    //方式2
    //Test.xib --编译后->Test.nib
    //加载xib,1
    
    CWShopView2 *view1= [CWShopView2 shopView];
    view1.frame=CGRectMake(100, 400, 70, 90);
    [view1 setData:self.goods[0]];
    [self.view addSubview:view1];
    
    
}


@end
