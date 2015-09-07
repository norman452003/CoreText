//
//  ImageViewController.m
//  图文混排Demo
//
//  Created by suning on 15/9/7.
//  Copyright (c) 2015年 suning. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismissController)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image = image;
}

- (UIImageView *)imageView{
    if (_imageView == nil){
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(0, 64, 300, 300);
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

- (void)dismissController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
