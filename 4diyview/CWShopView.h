//
//  CWShopView.h
//  4自定义view
//
//  Created by wei cui on 2019/10/25.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Goods;
NS_ASSUME_NONNULL_BEGIN

@interface CWShopView : UIView
/** 备注 */
@property (nonatomic, strong) UIImageView *imgView;
/** 备注 */
@property (nonatomic, strong) UILabel *titleView;

/** 商品模型 */
@property (nonatomic, strong) Goods *data;
@end

NS_ASSUME_NONNULL_END
