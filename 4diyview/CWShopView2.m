//
//  CWShopView2.m
//  4diyview
//
//  Created by wei cui on 2019/10/28.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "CWShopView2.h"
#import "Goods.h"
@implementation CWShopView2
+(instancetype)shopView{
    return  [self shopViewWithData:nil];
}
+(instancetype)shopViewWithData:(CWShopView2 *)data{
    NSLog(@"当前类名：%@", NSStringFromClass(self));
    CWShopView2 *shopView=[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
    shopView.data=data;
    return shopView;
}
/**
 重写模型数据的 set方法
 */
-(void)setData:(Goods *)data{
    NSLog(@"%@", data);
    _data=data;
    self.imgView.image=[UIImage imageNamed:data.icon];
    self.titleView.text=data.name;
}
@end
