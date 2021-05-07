//
//  JCPlaneDetailInfo_MFCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailInfo_MFCell : JCBaseTableViewCell_New<WKNavigationDelegate>

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIView *bgView;

@property (strong, nonatomic) WKWebView * webView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) NSAttributedString *htmlStr;

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;//方案详情

@property (nonatomic,strong) void(^JCImageBlock)(NSArray *array);

@property (nonatomic,strong) void(^JCRefreshBlock)(float height);

@property (nonatomic,assign) float height;

@end

NS_ASSUME_NONNULL_END
