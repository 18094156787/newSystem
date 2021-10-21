//
//  JCColumnRuleCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import <WebKit/WebKit.h>
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCColumnRuleCell : JCBaseTableViewCell_New<WKNavigationDelegate>

@property (nonatomic,strong) WKWebView *webView;

@property (nonatomic,strong) void(^JCRefreshBlock)(float height);

@property (nonatomic,assign) float height;

@property (nonatomic,assign) BOOL isLoad;

@property (nonatomic,strong) NSString *string;



@end

NS_ASSUME_NONNULL_END
