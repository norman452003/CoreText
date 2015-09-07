//
//  CoreTextData.h
//  CoreTextDemo
//
//  Created by TangQiao on 13-12-7.
//  Copyright (c) 2013年 TangQiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextImageData.h"

@interface CoreTextData : NSObject

@property (assign, nonatomic) CTFrameRef ctFrame;
@property (assign, nonatomic) CGFloat height;
@property (strong, nonatomic) NSArray * imageArray;
@property (strong, nonatomic) NSArray * linkArray;
@property (strong, nonatomic) NSAttributedString *content;

@end
