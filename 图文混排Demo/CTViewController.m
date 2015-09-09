//
//  CTViewController.m
//  图文混排Demo
//
//  Created by suning on 15/9/9.
//  Copyright (c) 2015年 suning. All rights reserved.
//

#import "CTViewController.h"
#import "CTTableViewCell.h"
#import "ImageViewController.h"
#import "WebViewController.h"
#import "CoreTextData.h"
#import "CoreTextImageData.h"
#import "CoreTextLinkData.h"
#import "SDWebImageManager.h"
#import "CTDisplayView.h"

@interface CTViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,copy) NSArray *dataArray;
@property (nonatomic,strong) NSCache *heightCache;
@end

@implementation CTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNotification];
    [self setUpTabelView];
}

- (void)setUpTabelView{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    NSDictionary *dict1 = @{
                            @"type" : @"img",
                            @"width" : @155,
                            @"height" : @155,
                            @"name" : @"http://a0.att.hudong.com/86/78/01300000312265122779782303112.jpg"
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
    
    NSDictionary *dict7 = @{
                            @"color" : @"green",
                            @"content" : @"看下位置对不对看下位置对不对 看下位置对不对看下位置对不对看下位置对不对看下位置对不对",
                            @"size" : @12,
                            @"type" : @"txt"
                            };
    NSString *str7 = [self stringWithObj:dict7];
    
    
    self.dataArray = @[[NSString stringWithFormat:@"[%@,%@,%@,%@,%@]",str1,str2,str3,str4,str5],[NSString stringWithFormat:@"[%@,%@,%@,%@,%@]",str1,str2,str3,str4,str6],[NSString stringWithFormat:@"[%@,%@,%@,%@,%@]",str1,str2,str3,str4,str7],[NSString stringWithFormat:@"[%@,%@,%@,%@,%@,%@]",str1,str2,str3,str4,str5,str6],[NSString stringWithFormat:@"[%@,%@,%@,%@,%@,%@,%@]",str1,str2,str3,str4,str5,str6,str7]];
}

- (NSString *)stringWithObj:(id)obj{
    NSData *data = [NSJSONSerialization dataWithJSONObject:obj options:0 error:NULL];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseIdentifier = @"reuseIdentifier";
    CTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil){
        cell = [[CTTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.json = self.dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = [[self.heightCache objectForKey:@(indexPath.row)] floatValue];
    if (height != 0){
        return height;
    }
    
    static NSString *reuseIdentifier = @"reuseIdentifier";
    CTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil){
        cell = [[CTTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    height = [cell rowHeight:self.dataArray[indexPath.row]];
    
    [self.heightCache setObject:@(height) forKey:@(indexPath.row)];
    
    return height;
}

- (NSCache *)heightCache{
    if (_heightCache == nil){
        _heightCache = [[NSCache alloc] init];
    }
    return _heightCache;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    [self.heightCache removeAllObjects];
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


@end
