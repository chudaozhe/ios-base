//
//  ViewController.m
//  ui-base
//
//  Created by wei cui on 2019/10/8.
//  Copyright © 2019 wei cui. All rights reserved.
//

#import "ViewController.h"
#import "CWHttp.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *show;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.view.subviews);
}
-(IBAction)green{
    _show.text=@"绿色";
    self.show.textColor=[UIColor greenColor];
    self.show.font=[UIFont systemFontOfSize:40];
    NSLog(@"green..");
}
-(IBAction)blue{
    _show.text=@"蓝色";
    self.show.font=[UIFont systemFontOfSize:40];
    self.show.textColor=[UIColor blueColor];
    NSLog(@"blue..");
}
-(IBAction)red{
    _show.text=@"红色";
    self.show.textColor=[UIColor redColor];
    NSLog(@"red..");
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self get1];
    //[self post1];
}
-(void)post1{
    //username: admin
    //password: cuiwei.net
    CWHttp *http=[[CWHttp alloc] init];
    [http http:@"/xcx_server/admin.php/login" data:@{@"username":@"admin", @"password":@"cuiwei.net"} method:@"POST"];
    [http requestHttp:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        //输出json字符串
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"good: %@",string);
    } failure:^(NSError * _Nullable error) {
        NSLog(@"request error");
    }];
}
-(void)get1{
    //http://xcx.cuiwei.net/xcx_server/admin.php/1/category

    CWHttp *http=[[CWHttp alloc] init];
    [http http:@"/xcx_server/admin.php/1/category" data:nil method:nil];
    [http requestHttp:^(NSData * _Nullable data, NSURLResponse * _Nullable response) {
        //解析json字符串 为字典
        NSDictionary *dict= [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"good: %@",dict);
    } failure:^(NSError * _Nullable error) {
        NSLog(@"request error");
    }];
    
    
}
@end
