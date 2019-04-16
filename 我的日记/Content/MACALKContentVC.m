//
//  MACALKContentVC.m
//  我的日记
//
//  Created by 鲁振 on 2019/4/8.
//  Copyright © 2019 鲁振. All rights reserved.
//

#import "MACALKContentVC.h"
#import <WebKit/WebKit.h>

#define ScreenWidth         [UIScreen mainScreen].bounds.size.width
#define ScreenHeight        [UIScreen mainScreen].bounds.size.height

@interface MACALKContentVC ()<WKNavigationDelegate,WKUIDelegate>

@property (nonatomic,strong) WKWebView *webView;

@end

@implementation MACALKContentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.webView = [[WKWebView alloc]initWithFrame:self.view.frame];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    //开了支持滑动返回
    self.webView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:self.webView];
    

    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
