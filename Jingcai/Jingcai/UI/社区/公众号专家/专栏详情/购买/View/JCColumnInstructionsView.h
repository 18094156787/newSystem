//
//  JCColumnInstructionsView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JCColumnInstructionsView : JCBaseView<WKNavigationDelegate>

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) WKWebView *webView;

@property (nonatomic,strong) NSString *period_foreshow;//周期说明

- (void)show;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
