//
//  CWShopView2.h
//  4diyview
//
//  Created by wei cui on 2019/10/28.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CWShopView2;
@class Goods;
NS_ASSUME_NONNULL_BEGIN

@interface CWShopView2 : UIView
+(instancetype)shopView;
+(instancetype)shopViewWithData:(CWShopView2 *)data;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
/** 模型数据 */
@property (nonatomic, strong) CWShopView2 *data;
@end

NS_ASSUME_NONNULL_END
