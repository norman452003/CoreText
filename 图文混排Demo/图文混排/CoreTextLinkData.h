//
//  CoreTextLinkData.h
//  CoreTextDemo
//
//  Created by TangQiao on 13-12-22.
//  Copyright (c) 2013年 TangQiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreTextLinkData : NSObject

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * url;
@property (assign, nonatomic) NSRange range;

@end
