//
//  ViewController.m
//  图文混排Demo
//
//  Created by suning on 15/9/7.
//  Copyright (c) 2015年 suning. All rights reserved.
//

#import "ViewController.h"
#import "CTDisplayView.h"
#import "CoreTextData.h"
#import "CTFrameParser.h"
#import "CTFrameParserConfig.h"
#import "SDWebImageManager.h"
#import "ImageViewController.h"
#import "CoreTextLinkData.h"
#import "WebViewController.h"
#import "CTTableViewCell.h"


@interface ViewController ()
@property (nonatomic,weak) CTDisplayView *displayView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpDisplayView];
    [self setUpUserInterface];
    [self setUpNotification];
}

- (void)setUpDisplayView{
    CTDisplayView *displayView = [[CTDisplayView alloc] initWithFrame:CGRectMake(0, 64,self.view.width , 300)];
    [self.view addSubview:displayView];
    self.displayView = displayView;
}

- (void)setUpUserInterface{
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    config.width = self.displayView.width;
    
    NSDictionary *dict1 = @{
                            @"type" : @"img",
                            @"width" : @60,
                            @"height" : @60,
                            @"name" : @"http://www.touxiang.cn/uploads/20131114/14-065802_226.jpg"
                            };
    NSString *str1 = [self stringWithObj:dict1];
    
    NSDictionary *dict2 = @{
                            @"color" : @"black",
                            @"content" : @"测试一下看行不行能不能自动换行看下还有没有其他的bug在😊 ",
                            @"size" : @18,
                            @"type" : @"txt"
                            };
    NSString *str2 = [self stringWithObj:dict2];
    
    NSDictionary *dict3 = @{
                            @"color" : @"blue",
                            @"content" : @"网页链接",
                            @"url" : @"http://www.suning.com",
                            @"type" : @"link"
                            };
    NSString *str3 = [self stringWithObj:dict3];
    
    NSDictionary *dict4 = @{
                            @"type" : @"img",
                            @"width" : @300,
                            @"height" : @160,
                            @"name" : @"http://img15.3lian.com/2015/f2/50/d/75.jpg"
                            };
    NSString *str4 = [self stringWithObj:dict4];
    
    NSDictionary *dict5 = @{
                            @"type" : @"img",
                            @"width" : @300,
                            @"height" : @160,
                            @"name" : @"http://img3.3lian.com/2013/s2/11/d/53.jpg"
                            };
    NSString *str5 = [self stringWithObj:dict5];
    
    NSDictionary *dict6 = @{
                            @"color" : @"orange",
                            @"content" : @"看下位置对不对看下位置对不对 看下位置对不对看下位置对不对看下位置对不对看下位置对不对",
                            @"size" : @16,
                            @"type" : @"txt"
                            };
    NSString *str6 = [self stringWithObj:dict6];
    
    NSDictionary *dict7 = @{
                            @"color" : @"green",
                            @"content" : @"看下位置对不对看下位置对不对 看下位置对不对看下位置对不对看下位置对不对看下位置对不对",
                            @"size" : @12,
                            @"type" : @"txt"
                            };
    NSString *str7 = [self stringWithObj:dict7];
    
    NSString *str = [NSString stringWithFormat:@"[%@,%@,%@,%@,%@,%@,%@]",str1,str2,str3,str4,str5,str6,str7];
    CoreTextData *data = [CTFrameParser pareeJSONString:str config:config];
    self.displayView.data = data;
    self.displayView.height = data.height;
    self.displayView.backgroundColor = [UIColor whiteColor];
}

- (NSString *)stringWithObj:(id)obj{
    NSData *data = [NSJSONSerialization dataWithJSONObject:obj options:0 error:NULL];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)setUpNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(imagePressed:) name:CTDisplayViewImagePressedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(linkPressed:) name:CTDisplayViewLinkPressedNotification object:nil];
}

- (void)imagePressed:(NSNotification *)note{
    CoreTextImageData *imageData = note.userInfo[@"imageData"];
    UIImage *image = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:imageData.name];
    ImageViewController *imageVC = [[ImageViewController alloc] init];
    imageVC.image = image;
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:imageVC];
    [self presentViewController:naviVC animated:YES completion:nil];
}

- (void)linkPressed:(NSNotification *)note{
    CoreTextLinkData *linkData = note.userInfo[@"linkData"];
    WebViewController *webViewVC = [[WebViewController alloc] init];
    webViewVC.urlStr = linkData.url;
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:webViewVC];
    [self presentViewController:naviVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
