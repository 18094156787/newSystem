//
//  UILabel+JNHtml.m
//  Jingcai
//
//  Created by Administrator on 2019/6/21.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "UILabel+JNHtml.h"

@implementation UILabel (JNHtml)
- (void)loadHtmlString:(NSString *)htmlString {
    self.attributedText = [self attributedContentWithString:htmlString];
}
- (NSAttributedString *)attributedContentWithString:(NSString *)content {
    NSString * htmlStr = [NSString stringWithFormat:@"<head><style>img{width:%f !important;height:auto}</style></head>",self.bounds.size.width];
    htmlStr = [htmlStr stringByAppendingString:NonNil(content)];
    
    //富文本，两种都可以
    NSDictionary * options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    NSData * data = [htmlStr dataUsingEncoding:NSUTF8StringEncoding];
    
    //设置富文本
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
    return attStr;
}
@end
