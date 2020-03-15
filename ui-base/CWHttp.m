//
//  CWHttp.m
//  ui-base
//
//  Created by wei cui on 2019/10/19.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "CWHttp.h"

@implementation CWHttp
- (instancetype)init
{
    self=[super init];
    if (nil!=self) {//判断父类是否初始化成功
        self._prefix=@"https://xcx.cuiwei.net";
    }
    return self;
}
-(void)http:(NSString *)uri data:(NSMutableDictionary * _Nullable) dict method:(NSString * _Nullable)method{
    if (method == nil) method=@"GET";
    NSLog(@"%@", method);
    NSURL *url=[NSURL URLWithString: [NSString stringWithFormat:@"%@%@", self._prefix ,uri]];
    NSLog(@"%@", url);
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod=method;
    if([method isEqualToString:@"POST"]) {
        //1遍历
        NSMutableString *body=[NSMutableString string];
        for (NSString *key in dict) {
             [body appendString:[NSString stringWithFormat:@"%@=%@&", key, dict[key]]];
        }
        NSLog(@"body:%@", [body substringToIndex:body.length-1]);
        request.HTTPBody=[[body substringToIndex:body.length-1] dataUsingEncoding:NSUTF8StringEncoding];
    }
    self.request=request;
}
-(void)requestHttp:(void (^)(NSData *__nullable data,NSURLResponse * __nullable response))success
                 failure:(void (^)(NSError *__nullable error))failure{
    NSURLSession *session=[NSURLSession sharedSession];
    //1创建任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:self.request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            failure(error);
        }else{
            if (success) {
                success(data, response);
            }
        }
    }];
    //2启动任务
    [task resume];
}
@end
