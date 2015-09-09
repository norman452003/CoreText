//
//  CTTableViewCell.h
//  图文混排Demo
//
//  Created by suning on 15/9/8.
//  Copyright (c) 2015年 suning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTTableViewCell : UITableViewCell
@property (nonatomic,copy) NSDictionary *dataDict;
- (CGFloat)rowHeight:(NSString *)json;
@property (nonatomic,copy) NSString *json;
@end
