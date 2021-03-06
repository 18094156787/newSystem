//
//  JCActivityRuleCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import <WebKit/WebKit.h>
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityRuleCell : JCBaseTableViewCell_New<WKNavigationDelegate>

@property (nonatomic,strong) UIView *timeView;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *timeInfoLab;

@property (nonatomic,strong) UILabel *ruleInfoLab;

@property (nonatomic,strong) WKWebView *webView;

@property (nonatomic,strong) UIImageView *timeBgView;

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic,strong) void(^JCRefreshBlock)(float height);

@property (nonatomic,assign) float height;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) UIImage *kindImageView;

@property (nonatomic,assign) BOOL haveTime;//包含活动时间的样式

@property (nonatomic,assign) BOOL isLoad;

@end

NS_ASSUME_NONNULL_END
