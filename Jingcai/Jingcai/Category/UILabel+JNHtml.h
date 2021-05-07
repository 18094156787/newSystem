//
//  UILabel+JNHtml.h
//  Jingcai
//
//  Created by Administrator on 2019/6/21.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UILabel (JNHtml)
- (void)loadHtmlString:(NSString *)htmlString;
@end
NS_ASSUME_NONNULL_END
