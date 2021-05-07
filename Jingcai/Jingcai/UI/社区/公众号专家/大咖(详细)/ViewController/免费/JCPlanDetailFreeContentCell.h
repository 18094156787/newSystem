//
//  JCPlanDetailFreeContentCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/14.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JCPlanDetailFreeContentCell : JCBaseTableViewCell_New<WKNavigationDelegate>

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;//方案详情

@property (strong, nonatomic) WKWebView * webView;

@property (strong, nonatomic) NSArray *imageUrlArr;

@property (nonatomic,strong) void(^JCRefreshBlock)(float height);

@property (nonatomic,assign) float height;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,assign) BOOL loadSuccess;

@end

NS_ASSUME_NONNULL_END
