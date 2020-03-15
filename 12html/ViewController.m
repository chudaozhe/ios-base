//
//  ViewController.m
//  12html
//  黄色/蓝色 目录的区别
//  https://blog.csdn.net/xtyzmnchen/article/details/70332330
//  Created by wei cui on 2020/3/11.
//  Copyright © 2020 wei cui. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@property (strong, nonatomic) WKWebView *webView;
/** 备注 */
@property (strong, nonatomic) UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView=[[WKWebView alloc]initWithFrame:CGRectMake(0, 100, 400, 200)];
    self.textView=[[UITextView alloc] initWithFrame:CGRectMake(0, 300, 400, 500)];
   
    
    //[self webViewLoad:[self webViewLoadFile]];
    //[self webViewLoad:[self webViewLoadFile2]];
    [self webViewLoadHtml];
    //[self textviewLoadHtml];
}
//注意static目录颜色（黄色），及里面demo.html的css,js文件路径
#pragma mark - webViewLoadFile
-(NSString *)webViewLoadFile{
    return [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"html"];
}
//注意static2目录颜色（蓝色），及里面demo.html的css,js文件路径
#pragma mark -webViewLoadFile2
-(NSString *)webViewLoadFile2{
    return [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"html" inDirectory:@"static2"];
}
-(void)webViewLoad:(NSString *)path{
    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:path]];
    [self.view addSubview:self.webView];
}
#pragma mark - webViewLoadHtml
-(void)webViewLoadHtml{
    NSMutableString *html=[NSMutableString string];
    [html appendString:@"<!DOCTYPE html><html><head>"];
    [html appendString:@"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"];

    [html appendString:@"<link rel=\"stylesheet\" type=\"text/css\" href=\"prism.css\">"];
    [html appendString:@"<script type=\"text/javascript\" src=\"prism.js\"></script>"];

    [html appendString:@"<style type=\"text/css\">*{font-weight:normal; color:#f00}</style>"];
    [html appendString:@"</head><body>"];
    [html appendString:@"<pre><code class=\"language-php\">"];
    [html appendString:@"var_dump(111);var_dump(111);var_dump(111);var_dump(111);var_dump(111);var_dump(111);var_dump(111);var_dump(111);"];
    [html appendString:@"</code></pre></body></html>"];

    [self.webView loadHTMLString:html baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    [self.view addSubview:self.webView];
}
//暂时认为 不能加载本地css文件
#pragma mark - textviewLoadHtml
-(void)textviewLoadHtml{
    NSMutableString *html=[NSMutableString string];
    [html appendString:@"<!DOCTYPE html><html><head>"];
    [html appendString:@"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"];

    [html appendString:@"<link rel=\"stylesheet\" type=\"text/css\" href=\"prism.css\">"];
    [html appendString:@"<script type=\"text/javascript\" src=\"prism.js\"></script>"];

    [html appendString:@"<style type=\"text/css\">*{font-weight:normal; color:#f00}</style>"];
    [html appendString:@"</head><body>"];
    [html appendString:@"<pre><code class=\"language-php\">"];
    [html appendString:@"var_dump(111);var_dump(111);var_dump(111);var_dump(111);var_dump(111);var_dump(111);var_dump(111);var_dump(111);"];
    [html appendString:@"</code></pre></body></html>"];

    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[html
    dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.textView.attributedText=attributedString;
    self.textView.editable=NO;//只读
    [self.view addSubview:self.textView];
}
@end
