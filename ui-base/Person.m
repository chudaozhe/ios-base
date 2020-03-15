//
//  Person.m
//  network
//
//  Created by wei cui on 2019/10/14.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "Person.h"

@implementation Person
/*//用了MJExtension就不用了
+(instancetype)personWithDict:(NSDictionary *)dict{
    Person *person=[[self alloc] init];
    //[person setValuesForKeysWithDictionary:dict]; //kvc全部字段
    person.name=dict[@"name"];
    person.age=[dict[@"age"] integerValue];
    return person;
}
 */
@end
