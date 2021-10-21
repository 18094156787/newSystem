//
//  JCColumnRuleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnRuleCell.h"

@implementation JCColumnRuleCell

- (void)initViews {
    [self.contentView addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(15);
        make.width.mas_equalTo(SCREEN_WIDTH-30);
        make.height.mas_equalTo(100);
        make.bottom.offset(0);
    }];
}

- (void)setString:(NSString *)string {
    _string = string;
    NSString *headStr = [NSString stringWithFormat:@"<head><style>img{max-width:%f !important;height:auto;font-size:14px}*{font-size:14px!important}</style></head>", SCREEN_WIDTH-60];
//    str = [str stringByAppendingString:@"\n\n\n\n"];
    NSString  * str = [NSString stringWithFormat:@"%@<html><meta content=\"width=device-width, initial-scale=1.0, maximum-scale=3.0, user-scalable=0; \" name=\"viewport\" /><body style=\"overflow-wrap:break-word;word-break:break-all;white-space: normal; font-size:14px!important;  \">%@</body></html>",headStr,string];
    [self.webView loadHTMLString:str baseURL:nil];
}

//- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
//    _detailModel = detailModel;
////    [self.webView loadHTMLString:detailModel.rule baseURL:nil];
//        if (!detailModel) {
//            return;
//        }
//    self.timeLab.text = [NSString stringWithFormat:@"%@-%@",detailModel.start_time,detailModel.end_time];
//
//    NSString *headStr = [NSString stringWithFormat:@"<head><style>img{max-width:%f !important;height:auto;font-size:14px}*{font-size:14px!important}</style></head>", SCREEN_WIDTH-60];
////    str = [str stringByAppendingString:@"\n\n\n\n"];
//    NSString  * str = [NSString stringWithFormat:@"%@<html><meta content=\"width=device-width, initial-scale=1.0, maximum-scale=3.0, user-scalable=0; \" name=\"viewport\" /><body style=\"overflow-wrap:break-word;word-break:break-all;white-space: normal; font-size:14px!important;  \">%@</body></html>",headStr,self.detailModel.rule];
//    [self.webView loadHTMLString:str baseURL:nil];
//
//
//}

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
                self.JCRefreshBlock(self.height);
                [self.webView setNeedsLayout];

                }
        }


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
