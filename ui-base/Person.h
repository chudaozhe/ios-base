//
//  Person.h
//  network
//
//  Created by wei cui on 2019/10/14.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
/** 姓名 */
@property (nonatomic, strong) NSString *name;
/** 年龄 */
@property (nonatomic, assign) NSInteger age;
/** 身高 */
@property (nonatomic, strong) NSString *height;

//+(instancetype)personWithDict:(NSDictionary *)dict;//用了MJExtension就不用了
@end

NS_ASSUME_NONNULL_END
