//
//  CWHttp.h
//  ui-base
//
//  Created by wei cui on 2019/10/19.
//  Copyright © 2019 wei cui. All rights reserved.
//  https://www.cnblogs.com/HJQ2016/p/6055617.html
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CWHttp : NSObject
/** 前缀 */
@property (nonatomic, strong) NSString *_prefix;
/** 备注 */
@property (nonatomic, strong) NSMutableURLRequest *request;
//_Nullable 参数可以是NULL 或 nil
//_Nonnull 参数不能为空
-(void)http:(NSString * _Nonnull)uri data:(NSDictionary * _Nullable) dict method:(NSString * _Nullable)method;
-(void)requestHttp:(nullable void (^)(NSData *__nullable data,NSURLResponse * __nullable response))success
   failure:(nullable void (^)(NSError *__nullable error))failure;
@end

NS_ASSUME_NONNULL_END
