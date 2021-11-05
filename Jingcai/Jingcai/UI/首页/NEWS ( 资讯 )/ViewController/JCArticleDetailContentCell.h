//
//  JCArticleDetailContentCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import <WebKit/WebKit.h>
#import "JCDaShangView.h"
#import "JCWNewsDetailBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCArticleDetailContentCell : JCBaseTableViewCell_New<WKNavigationDelegate>

@property (strong, nonatomic) JCWNewsDetailBall * newsDetailBall;

@property (strong, nonatomic) WKWebView * webView;

@property (strong, nonatomic) NSArray *imageUrlArr;

@property (nonatomic,strong) void(^JCRefreshBlock)(float height);

@property (nonatomic,assign) float height;

@property (nonatomic,strong) JCDaShangView *dsView;//打赏

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,assign) BOOL loadSuccess;

@end

NS_ASSUME_NONNULL_END
