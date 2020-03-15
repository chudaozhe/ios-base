//
//  main.m
//  ui-base
//
//  Created by wei cui on 2019/10/8.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import <MJExtension/MJExtension.h>

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    //get1();
    /*
    NSString *jsonString=@"{\"person\":[{\"name\":\"cw\", \"age\":10, \"height\":1.78}, {\"name\":\"cw2\", \"age\":20, \"height\":1.78}, {\"name\":\"cw3\", \"age\":10, \"height\":1.78}]}";
    //1字符串转nsdata
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e = nil;
    //2解析nadata
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&e];
    //NSLog(@"%@", json[@"person"]);
    NSMutableArray *newArr=[Person mj_objectArrayWithKeyValuesArray:json[@"person"]];
    for (Person *item in newArr) {
        NSLog(@"name=%@, height=%@", item.name, item.height);
    }
    */
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

