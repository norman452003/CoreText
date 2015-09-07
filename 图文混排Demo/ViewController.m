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

@interface ViewController ()
@property (nonatomic,weak) CTDisplayView *displayView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpDisplayView];
    [self setUpUserInterface];
}

- (void)setUpDisplayView{
    CTDisplayView *displayView = [[CTDisplayView alloc] initWithFrame:CGRectMake(0, 0,self.view.width , 300)];
    [self.view addSubview:displayView];
    self.displayView = displayView;
}

- (void)setUpUserInterface{
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    config.width = self.displayView.width;
    
    NSDictionary *dict1 = @{
                            @"type" : @"img",
                            @"width" : @300,
                            @"height" : @160,
                            @"name" : @"http://a0.att.hudong.com/86/78/01300000312265122779782303112.jpg"
                            };
    NSString *str1 = [self stringWithObj:dict1];
    
    NSDictionary *dict2 = @{
                            @"color" : @"black",
                            @"content" : @"测试一下看行不行能不能自动换行看下还有没有其他的bug在 ",
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
                            @"name" : @"http://a2.att.hudong.com/81/77/01300000312265122779776120723.jpg"
                            };
    NSString *str4 = [self stringWithObj:dict4];
    
    NSDictionary *dict5 = @{
                            @"type" : @"img",
                            @"width" : @300,
                            @"height" : @160,
                            @"name" : @"http://pic23.nipic.com/20120821/10310360_120042319149_2.jpg"
                            };
    NSString *str5 = [self stringWithObj:dict5];
    
    NSDictionary *dict6 = @{
                            @"color" : @"orange",
                            @"content" : @"看下位置对不对看下位置对不对 看下位置对不对看下位置对不对看下位置对不对看下位置对不对",
                            @"size" : @16,
                            @"type" : @"txt"
                            };
    NSString *str6 = [self stringWithObj:dict6];
    
    NSString *str = [NSString stringWithFormat:@"[%@,%@,%@,%@,%@,%@]",str1,str2,str3,str4,str5,str6];
    CoreTextData *data = [CTFrameParser pareeJSONString:str config:config];
    self.displayView.data = data;
    self.displayView.height = data.height;
    self.displayView.backgroundColor = [UIColor whiteColor];
}

- (NSString *)stringWithObj:(id)obj{
    NSData *data = [NSJSONSerialization dataWithJSONObject:obj options:0 error:NULL];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
