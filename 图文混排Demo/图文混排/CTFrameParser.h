//
//  CTFrameParser.h
//  CoreTextDemo
//
//  Created by TangQiao on 13-12-7.
//  Copyright (c) 2013年 TangQiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "CTFrameParserConfig.h"

@interface CTFrameParser : NSObject

+ (NSMutableDictionary *)attributesWithConfig:(CTFrameParserConfig *)config;

+ (CoreTextData *)parseContent:(NSString *)content config:(CTFrameParserConfig*)config;

+ (CoreTextData *)parseAttributedContent:(NSAttributedString *)content config:(CTFrameParserConfig*)config;

+ (CoreTextData *)parseTemplateFile:(NSString *)path config:(CTFrameParserConfig*)config;

+ (CoreTextData *)pareeJSONString:(NSString *)jsonStr config:(CTFrameParserConfig *)config;
@end
