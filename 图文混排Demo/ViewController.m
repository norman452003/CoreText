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
    
    
    [self setUpUserInterface];
}

- (void)setUpUserInterface{
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
