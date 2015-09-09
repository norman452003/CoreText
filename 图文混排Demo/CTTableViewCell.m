//
//  CTTableViewCell.m
//  图文混排Demo
//
//  Created by suning on 15/9/8.
//  Copyright (c) 2015年 suning. All rights reserved.
//

#import "CTTableViewCell.h"
#import "CTDisplayView.h"
#import "CoreTextData.h"
#import "CTFrameParser.h"
#import "CTFrameParserConfig.h"

@interface CTTableViewCell ()
@property (nonatomic,weak) CTDisplayView *displayView;
@end

@implementation CTTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        CTDisplayView *displayView = [[CTDisplayView alloc] init];
        self.displayView = displayView;
        [self.contentView addSubview:displayView];
        self.displayView.frame = CGRectMake(10, 10, kScreenW - 20, 20);
    }
    return self;
}

- (void)setDataDict:(NSDictionary *)dataDict{
    _dataDict = dataDict;
    NSString *str = [NSString stringWithFormat:@"[%@]",dataDict];
    NSData *Data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:Data options:0 error:NULL];
    NSLog(@"%@",array);
    
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    CoreTextData *textData = [CTFrameParser pareeJSONString:str config:config];
    self.displayView.data = textData;
    self.displayView.height = textData.height;
    self.displayView.backgroundColor = [UIColor whiteColor];
    
}

- (void)setJson:(NSString *)json{
    _json = json;
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    CoreTextData *textData = [CTFrameParser pareeJSONString:json config:config];
    self.displayView.data = textData;
    self.displayView.height = textData.height;
    self.displayView.backgroundColor = [UIColor whiteColor];
    
}

- (CGFloat)rowHeight:(NSString *)json{
    
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    CoreTextData *textData = [CTFrameParser pareeJSONString:json config:config];
    self.displayView.data = textData;
    self.displayView.height = textData.height;
    self.displayView.backgroundColor = [UIColor whiteColor];

    return self.displayView.height + 20;
}

@end
