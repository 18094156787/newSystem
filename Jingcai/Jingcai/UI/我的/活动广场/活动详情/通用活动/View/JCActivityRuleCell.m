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
        make.size.mas_equalTo(CGSizeMake(98, 16));
    }];
    self.timeBgView = timeBgView;
    
    UILabel *titleLab = [UILabel initWithTitle:@"活动规则" andFont:16 andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [timeBgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    self.titleLab = titleLab;
    
    [bgView addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(timeBgView.mas_bottom).offset(15);
        make.left.offset(15);
        make.width.mas_equalTo(SCREEN_WIDTH-60);
//            make.bottom.offset(AUTO(-50));
        make.height.mas_equalTo(100);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
    }];
}

- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    _detailModel = detailModel;
//    [self.webView loadHTMLString:detailModel.rule baseURL:nil];
        if (!detailModel) {
            return;
        }

    
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
                self.JCRefreshBlock(self.height+40);
                [self.webView setNeedsLayout];

                }
        }


    }];
}

- (void)setKindImageView:(UIImage *)kindImageView {
    _kindImageView = kindImageView;
    self.titleLab.textColor = COLOR_FB5835;
    self.timeBgView.backgroundColor = UIColorFromRGB(0xFFFDFA);
    self.timeBgView.image = kindImageView;
    [self.timeBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(119, 22));
    }];
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
@end
