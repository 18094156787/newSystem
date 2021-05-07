//
//  JCYCRuleContentCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCRuleContentCell.h"

@implementation JCYCRuleContentCell

- (void)initViews {
    
//    [self.contentView addSubview:self.bgView];
//    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsZero);
//    }];
    
    
//    [self.bgView addSubview:self.webView];
//    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.bgView);
//        make.left.offset(AUTO(15));
//        make.width.mas_equalTo(SCREEN_WIDTH-30);
//        make.bottom.equalTo(self.bgView).offset(0);
//
//    }];

    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, AUTO(15), 3, AUTO(15)));
    }];

}
- (void)setModel:(JCJingCaiRuleModel *)model {
    _model = model;
    
    NSString *string = model.content;
    self.contentLab.text = model.content;
//    [self.webView loadHTMLString:[self autoWebAutoImageSize:[self htmlWithContent:string]] baseURL:nil];
//     [self.webView sizeToFit];
}

- (NSString *)htmlWithContent:(NSString *)content {
    NSString * htmlString = @"";
    //meta
    htmlString = [htmlString stringByAppendingString:@"<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no\" />"];
    htmlString = [htmlString stringByAppendingString:@"<html><body><div style='margin:0px'>"];
    //标题(字体大小==18)
//    htmlString = [htmlString stringByAppendingString:@"<h3 style='font-family:PingFang SC Regular;font-size:12px;color:#666666'>"];
//    htmlString = [htmlString stringByAppendingString:@"<h3  img{ width: 100%%;}"];
    htmlString = [htmlString stringByAppendingString:NonNil(content)];
    htmlString = [htmlString stringByAppendingString:@"</h3>"];

    
    htmlString = [htmlString stringByAppendingString:@"</div></body></html>"];
    NSLog(@"htmlString == \n%@", htmlString);
    //替换windows的换行符为：html换行符
    NSMutableString * showHtmlString = [[NSMutableString alloc] initWithString:htmlString];
//    [showHtmlString replaceOccurrencesOfString:@"\r\n" withString:@"<br>" options:NSCaseInsensitiveSearch range:NSMakeRange(0, showHtmlString.length)];
    NSLog(@"%@", showHtmlString);
    return showHtmlString;
}
- (NSString *)autoWebAutoImageSize:(NSString *)html{

    return [NSString stringWithFormat:@"<html><head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'><style>img{ width: 100%%; margin: 0; padding: 0 3; box-sizing: border-box;} img{ width: 100%%;}</style></head><body>%@</body></html>", html];

}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    [webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable result,NSError *_Nullable error) {
        //获取页面高度
        CGFloat scrollHeight = [result doubleValue];
        NSLog(@"scrollHeight 即为所求：%f",scrollHeight);
        
//            [self.contentView addSubview:self.webView];
//            [self.webView mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.left.equalTo(self.contentView);
//                make.width.mas_equalTo(SCREEN_WIDTH-30);
//                make.height.mas_equalTo(scrollHeight);
//                make.bottom.equalTo(self.contentView).offset(AUTO(-15));
//
//
//            }];
        if (self.model.contentHeight==0) {
            self.model.contentHeight = scrollHeight;
                    if (self.JCRefreshBlock) {
                self.JCRefreshBlock();
            }
        }
        

        
//        //调整View位置
//        CGFloat selfW = self.view.bounds.size.width;
//        CGFloat webY = CGRectGetMaxY(self.titleLabel.frame)+10;
//        CGFloat webH = scrollHeight;
//        self.likeTopConstraint.constant = webH+40;
//        self.wkWebView.frame = CGRectMake(10, webY, selfW-20, webH);
//
//        if (self.needReturnHeightBlock) {
//            [self.view layoutIfNeeded];
//            self.needReturnHeightBlock([self contentH]);
//        }
//
//        if (self.loadingFinishBlock) {
//            self.loadingFinishBlock();
//        }
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
    }
    return _webView;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;;
}

@end
