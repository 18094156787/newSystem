//
//  JCActivityRuleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityRuleCell.h"

@implementation JCActivityRuleCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:16];
    bgView.backgroundColor = JCWhiteColor;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, AUTO(15), AUTO(15), AUTO(15)));
    }];
    

    
    UIImageView *timeBgView = [UIImageView new];
    timeBgView.image = JCIMAGE(@"jc_activity_titleBg");
    [bgView addSubview:timeBgView];
    [timeBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(151, 16));
    }];
    self.timeBgView = timeBgView;
    
    UILabel *titleLab = [UILabel initWithTitle:@"活动时间&规则" andFont:16 andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [timeBgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    self.titleLab = titleLab;
    
    [bgView addSubview:self.timeView];
    [self.timeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(timeBgView.mas_bottom).offset(15);
        make.height.mas_equalTo(90);
    }];
    
    [self.timeView addSubview:self.timeInfoLab];
    [self.timeInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(23);
        make.top.offset(0);
    }];
    
    [self.timeView addSubview:self.ruleInfoLab];
    [self.ruleInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeInfoLab);
        make.bottom.offset(0);
    }];
    
    [self.timeView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeInfoLab);
        make.top.equalTo(self.timeInfoLab.mas_bottom).offset(5);
    }];
    
    [bgView addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeView.mas_bottom).offset(0);
        make.left.offset(15);
        make.width.mas_equalTo(SCREEN_WIDTH-60);
//            make.bottom.offset(AUTO(-50));
        make.height.mas_equalTo(100);
//            make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
    }];
}

//- (void)setHaveTime:(BOOL)haveTime {
//    _haveTime = haveTime;
//    self.titleLab.text = @"活动时间&规则";
//    [self.timeBgView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(151, 16));
//    }];
//
//    
//}

- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    _detailModel = detailModel;
//    [self.webView loadHTMLString:detailModel.rule baseURL:nil];
        if (!detailModel) {
            return;
        }
    self.timeLab.text = [NSString stringWithFormat:@"%@-%@",detailModel.start_time,detailModel.end_time];
    
    NSString *headStr = [NSString stringWithFormat:@"<head><style>img{max-width:%f !important;height:auto;font-size:14px}*{font-size:14px!important}</style></head>", SCREEN_WIDTH-60];
//    str = [str stringByAppendingString:@"\n\n\n\n"];
    NSString  * str = [NSString stringWithFormat:@"%@<html><meta content=\"width=device-width, initial-scale=1.0, maximum-scale=3.0, user-scalable=0; \" name=\"viewport\" /><body style=\"overflow-wrap:break-word;word-break:break-all;white-space: normal; font-size:14px!important;  \">%@</body></html>",headStr,self.detailModel.rule];
    [self.webView loadHTMLString:str baseURL:nil];
    
//    [self.webView loadHTMLString:self.detailModel.rule baseURL:nil];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.isLoad = NO;
    [webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable result,NSError *_Nullable error) {
        //获取页面高度
        CGFloat scrollHeight = [result doubleValue];
//        CGFloat scrollHeight = self.webView.scrollView.contentSize.height+AUTO(150);
        NSLog(@"滚动高度：%f",scrollHeight);
        NSLog(@"即为所求：%f",[result doubleValue]);
//        self.webView.frame = CGRectMake(AUTO(15), 0, SCREEN_WIDTH-AUTO(30), scrollHeight);
            [self.webView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(scrollHeight);

            }];
        
//        [webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '250%'"completionHandler:nil];

        
        if (self.height==0) {

            if (self.JCRefreshBlock) {
                self.height = scrollHeight;
                self.JCRefreshBlock(self.height+40+90);
                [self.webView setNeedsLayout];

                }
        }


    }];
}

//开始加载
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{


    if ([webView.URL.absoluteString containsString:@"app_jump"]) {
        [JCPageRedirectManager jumpVCWithRoute:webView.URL.absoluteString vc:[self getViewController]];
    }
      
}

//服务器开始请求的时候调用
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    // 如果不添加这个，那么wkwebview跳转不了AppStore
//
//    if ([webView.URL.absoluteString containsString:@"app_jump"]) {
//        [JCPageRedirectManager jumpVCWithRoute:webView.URL.absoluteString vc:[self getViewController]];
//
//
//        
//
//        decisionHandler(WKNavigationActionPolicyCancel);
//    }
//    else  {
//        decisionHandler(WKNavigationActionPolicyAllow);
//    }
//}

- (void)setKindImageView:(UIImage *)kindImageView {
    _kindImageView = kindImageView;
    self.titleLab.textColor = COLOR_FB5835;
    self.timeBgView.backgroundColor = UIColorFromRGB(0xFFFDFA);
    self.timeBgView.image = kindImageView;
    [self.timeBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(171, 22));
    }];
    
    self.timeLab.textColor = COLOR_FB5835;
    self.ruleInfoLab.textColor = COLOR_FB5835;
}

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [WKWebView new];
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
        _webView.navigationDelegate = self;
        
        _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _webView.scrollView.scrollEnabled = NO;
        _webView.userInteractionEnabled = YES;
//        _webView.contentScaleFactor = 1;
    }
    return _webView;
}

- (UIView *)timeView {
    if (!_timeView) {
        _timeView = [UIView new];
    }
    return _timeView;
}

- (UILabel *)timeInfoLab {
    if (!_timeInfoLab) {
        _timeInfoLab = [UILabel initWithTitle:@"活动时间" andFont:AUTO(14) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeInfoLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UILabel *)ruleInfoLab {
    if (!_ruleInfoLab) {
        _ruleInfoLab = [UILabel initWithTitle:@"规则说明" andFont:AUTO(14) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _ruleInfoLab;
}
@end
