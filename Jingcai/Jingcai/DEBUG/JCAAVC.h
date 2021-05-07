//
//  JCAAVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/2.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseViewController.h"
typedef void(^JCWebViewLoadSuccessBlock)(void);
typedef void(^JCWebViewLoadFailureBlock)(void);
NS_ASSUME_NONNULL_BEGIN

@interface JCAAVC : JCBaseViewController
@property (strong, nonatomic) NSString * titleStr;
@property (strong, nonatomic) NSString * urlStr;
@property (assign, nonatomic)  BOOL isYCRule;//yes 跳转精彩规则展示
@property (copy, nonatomic) JCWebViewLoadSuccessBlock loadSuccessBlock;
@property (copy, nonatomic) JCWebViewLoadFailureBlock loadFailureBlock;
- (void)loadWebData;
@end

NS_ASSUME_NONNULL_END
