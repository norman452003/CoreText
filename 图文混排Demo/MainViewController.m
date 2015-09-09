//
//  MainViewController.m
//  图文混排Demo
//
//  Created by suning on 15/9/9.
//  Copyright (c) 2015年 suning. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "CTViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad{
    [super viewDidLoad];
}
- (IBAction)pushToViewController:(id)sender {
    
    ViewController *VC = [[ViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
}
- (IBAction)pushToCTTableViewController:(id)sender {
    CTViewController *VC = [[CTViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
