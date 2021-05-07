//
//  JCYCRuleContentCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import <WebKit/WebKit.h>
#import "JCJingCaiRuleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCRuleContentCell : JCBaseTableViewCell_New<WKNavigationDelegate>

@property (strong, nonatomic) UIView *bgView;

@property (strong, nonatomic) WKWebView * webView;

@property (strong, nonatomic) UILabel * contentLab;

@property (strong, nonatomic) JCJingCaiRuleModel *model;

@property (nonatomic, copy) void(^JCRefreshBlock)(void);

@end

NS_ASSUME_NONNULL_END
