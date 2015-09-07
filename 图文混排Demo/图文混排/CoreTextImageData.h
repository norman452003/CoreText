//
//  CoreTextImageData.h
//  CoreTextDemo
//
//  Created by TangQiao on 13-12-8.
//  Copyright (c) 2013年 TangQiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreTextImageData : NSObject

@property (strong, nonatomic) NSString * name;
@property (nonatomic) int position;

// 此坐标是 CoreText 的坐标系，而不是UIKit的坐标系
@property (nonatomic) CGRect imagePosition;

@end
