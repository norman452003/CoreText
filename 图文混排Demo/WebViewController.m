//
//  WebViewController.m
//  图文混排Demo
//
//  Created by suning on 15/9/7.
//  Copyright (c) 2015年 suning. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismissController)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setUrlStr:(NSString *)urlStr{
    _urlStr = urlStr;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [self.webView loadRequest:request];
}

- (UIWebView *)webView{
    if (_webView == nil){
        _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (void)dismissController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
