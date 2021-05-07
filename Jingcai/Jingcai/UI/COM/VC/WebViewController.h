//
//  WebViewController.h
//  CoinWay
//
//  Created by Rain on 2018/7/15.
//  Copyright © 2018年 rain. All rights reserved.
//

#import "JCBaseViewController.h"

typedef void(^JCWebViewLoadSuccessBlock)(void);
typedef void(^JCWebViewLoadFailureBlock)(void);

@interface WebViewController : JCBaseViewController
@property (strong, nonatomic) NSString * titleStr;
@property (strong, nonatomic) NSString * urlStr;
@property (assign, nonatomic)  BOOL isYCRule;//yes 跳转精彩规则展示
@property (copy, nonatomic) JCWebViewLoadSuccessBlock loadSuccessBlock;
@property (copy, nonatomic) JCWebViewLoadFailureBlock loadFailureBlock;
- (void)loadWebData;
@end
