//
//  JCArticleDetailContentCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCArticleDetailContentCell.h"
#import "JCWDateTool.h"
#import "YBImageBrowser.h"
@implementation JCArticleDetailContentCell

- (void)initViews {
        [self.contentView addSubview:self.webView];
    //    self.webView.frame = CGRectMake(AUTO(15), 50, SCREEN_WIDTH-AUTO(30), 100);
        [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.left.offset(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
//            make.bottom.offset(AUTO(-50));
            make.height.mas_equalTo(50);
    //        make.bottom.equalTo(self.contentView.mas_bottom).offset(AUTO(-50));
        }];
    
    [self.contentView addSubview:self.dsView];
    [self.dsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.right.offset(AUTO(-12));
        make.top.equalTo(self.webView.mas_bottom);
        make.height.mas_equalTo(AUTO(140));
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    infoLab.numberOfLines= 0;
    [self.contentView addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.right.offset(AUTO(-12));
        make.top.equalTo(self.dsView.mas_bottom);
    }];
    self.infoLab = infoLab;
}

- (void)setNewsDetailBall:(JCWNewsDetailBall *)newsDetailBall {
    _newsDetailBall = newsDetailBall;
    if (!newsDetailBall) {
        return;
    }
    if (self.loadSuccess&&newsDetailBall) {
        return;
    }
//    [self.webView loadHTMLString:[self html] baseURL:nil];
    NSString *imgWidth = [NSString stringWithFormat:@"<head><style>img{width:%fpx !important;height:auto}</style></head>",SCREEN_WIDTH-AUTO(30)];
    NSString *style = [NSString stringWithFormat:@"<html><head><meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\" name=\"viewport\"><style type=\"text/css\"></style></head>%@<body></body></html>",imgWidth];
    NSString *str = [NSString stringWithFormat:@"%@%@",self.newsDetailBall.content,style];
//    [self.newsDetailBall.content stringByAppendingString: @"<html><head><meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\" name=\"viewport\"><style type=\"text/css\"></style></head><body></body></html>"];
//       [self.webView loadHTMLString:[self html] baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]]];
    [self.webView loadHTMLString:str baseURL:nil];
}

//开始加载
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{


    if ([webView.URL.absoluteString containsString:@"app_jump"]) {
        [JCPageRedirectManager jumpVCWithRoute:webView.URL.absoluteString vc:[self getViewController]];
    }
      
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    [webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable result,NSError *_Nullable error) {
        //获取页面高度
        CGFloat scrollHeight = [result doubleValue]+AUTO(0);
//        CGFloat scrollHeight = self.webView.scrollView.contentSize.height+AUTO(150);
        NSLog(@"滚动高度：%f",scrollHeight);
        NSLog(@"即为所求：%f",[result doubleValue]);
            [self.webView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(scrollHeight);

            }];
        if (self.height==0) {
            self.infoLab.text = @"免责声明：鲸猜足球仅为信息发布平台，并不对第三方发布的信息真实性及准确性负责，且不提供彩票售卖服务，请您注意投资风险，理性购买！";
            if (self.JCRefreshBlock) {

                self.height = scrollHeight+AUTO(70)+AUTO(140);
                self.loadSuccess = YES;
                self.JCRefreshBlock(self.height);
                [self.webView setNeedsLayout];

                }
        }
        [self addImgClickJS];

    }];
}



- (void)addImgClickJS {
    
    //获取所以的图片标签
    [self.webView evaluateJavaScript:@"function getImages(){\
         var imgs = document.getElementsByTagName('img');\
         var imgScr = '';\
         for(var i=0;i<imgs.length;i++){\
             if (i == 0){ \
                imgScr = imgs[i].src; \
             } else {\
                imgScr = imgScr +'***'+ imgs[i].src;\
             } \
         };\
         return imgScr;\
     };" completionHandler:nil];//注入js方法

    __weak typeof(self)weakSelf = self;
    [self.webView evaluateJavaScript:@"getImages()" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        
        if (!error) {
            
            NSMutableArray * urlArray = result?[NSMutableArray arrayWithArray:[result componentsSeparatedByString:@"***"]]:nil;
            NSLog(@"urlArray = %@",urlArray);
            weakSelf.imageUrlArr = urlArray;
        } else {
            weakSelf.imageUrlArr = @[];
        }
    }];
   
    //添加图片点击的回调
    [self.webView evaluateJavaScript:@"function registerImageClickAction(){\
         var imgs = document.getElementsByTagName('img');\
         for(var i=0;i<imgs.length;i++){\
             imgs[i].customIndex = i;\
             imgs[i].onclick=function(){\
                window.location.href='image-preview-index:'+this.customIndex;\
             }\
         }\
     }" completionHandler:nil];
//    [self.webView evaluateJavaScript:@"registerImageClickAction();" completionHandler:nil];
    [self.webView evaluateJavaScript:@"registerImageClickAction();" completionHandler:^(id _Nullable object, NSError * _Nullable error) {
        NSLog(@"查看");
    }];
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    // 类似 UIWebView 的 -webView: shouldStartLoadWithRequest: navigationType:
    //预览图片
    NSURL * url = navigationAction.request.URL;
    if ([url.scheme isEqualToString:@"image-preview-index"]) {
//        //图片点击回调
        NSInteger index = [[url.absoluteString substringFromIndex:[@"image-preview-index:" length]] integerValue];
        NSString * imgPath = self.imageUrlArr.count > index?self.imageUrlArr[index]:nil;
        NSLog(@"imgPath = %@",imgPath);
        if (self.imageUrlArr.count>0) {
            [self showBigImage:self.imageUrlArr Index:index];
        }
        decisionHandler(WKNavigationActionPolicyCancel);
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

- (void)showBigImage:(NSArray *)imgArray Index:(NSInteger)index{
    NSMutableArray *datas = [NSMutableArray array];
    [imgArray enumerateObjectsUsingBlock:^(NSString *_Nonnull url, NSUInteger idx, BOOL * _Nonnull stop) {
//                    JCImgCollectionViewCell *cell = (JCImgCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
//        // 网络图片
        YBIBImageData *data = [YBIBImageData new];
        if ([url containsString:@"wx_fmt"]) {
            NSArray *array = [url componentsSeparatedByString:@"?"];
            if (array.count>1) {
                data.imageURL = [NSURL URLWithString:array.firstObject];
            }else{
                data.imageURL = [NSURL URLWithString:url];
            }
        }else{
            data.imageURL = [NSURL URLWithString:url];
        }
        
        [datas addObject:data];
    }];


    YBImageBrowser *browser = [YBImageBrowser new];
    browser.shouldHideStatusBar = NO;
    browser.dataSourceArray = datas;
    browser.currentPage = index;
    [browser show];
}

- (NSString *)html {
    NSString * htmlString = @"";
    //meta
    htmlString = [htmlString stringByAppendingString:@"<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,minimum-scale=0.8,maximum-scale=0.8,user-scalable=no\" />"];
    htmlString = [htmlString stringByAppendingString:@"<html><body><div style='margin:8px'>"];
    //标题(字体大小==18)
//    htmlString = [htmlString stringByAppendingString:@"<h3 style='font-family:PingFang SC Bold;font-size:14px;color:#333333'>"];
//    htmlString = [htmlString stringByAppendingString:NonNil(self.newsDetailBall.title)];
//    htmlString = [htmlString stringByAppendingString:@"</h3>"];
////    作者时间(字体大小==14)
//    self.newsDetailBall.original = 1;
//    if (self.newsDetailBall.original==1) {
//
//        if (self.newsDetailBall.source.length>0) {
//           htmlString = [htmlString stringByAppendingString:@"<span style='font-family:PingFang SC Regular;font-size:14px;color:#333333'>"];//FF3031
//                   //    htmlString = [htmlString stringByAppendingString:NonNil(self.newsDetailBall.name)];
//
//           htmlString = [htmlString stringByAppendingString:@"原创 ·"];
//            htmlString = [htmlString stringByAppendingString:@"<span style='font-family:PingFang SC Regular;font-size:14px;color:#333333'>"];//FF3031
//            htmlString = [htmlString stringByAppendingString:self.newsDetailBall.source];
//        }else{
//            htmlString = [htmlString stringByAppendingString:@"<span style='font-family:PingFang SC Regular;font-size:14px;color:#333333'>"];//FF3031
//                    //    htmlString = [htmlString stringByAppendingString:NonNil(self.newsDetailBall.name)];
//
//            htmlString = [htmlString stringByAppendingString:@"原创 ·"];
//        }
//
//    }
//    if (self.newsDetailBall.original==2&&self.newsDetailBall.source.length>0) {
//            htmlString = [htmlString stringByAppendingString:@"<span style='font-family:PingFang SC Regular;font-size:14px;color:#999999'>"];//FF3031
//
//        htmlString = [htmlString stringByAppendingString:@"转载 ·"];
//         htmlString = [htmlString stringByAppendingString:@"<span style='font-family:PingFang SC Regular;font-size:14px;color:#333333'>"];
//            htmlString = [htmlString stringByAppendingString:@"<span style='font-family:PingFang SC Regular;font-size:14px;color:#333333'>"];//FF3031
//        htmlString = [htmlString stringByAppendingString:self.newsDetailBall.source];
//    }
//    if (self.newsDetailBall.original==3&&self.newsDetailBall.source.length>0) {
//            htmlString = [htmlString stringByAppendingString:@"<span style='font-family:PingFang SC Regular;font-size:14px;color:#333333'>"];//FF3031
//        //    htmlString = [htmlString stringByAppendingString:NonNil(self.newsDetailBall.name)];
//        htmlString = [htmlString stringByAppendingString:self.newsDetailBall.source];
//    }
//    htmlString = [htmlString stringByAppendingString:@"<span style='font-family:PingFang SC Regular;font-size:14px;color:#333333'>"];//FF3031
////    htmlString = [htmlString stringByAppendingString:NonNil(self.newsDetailBall.name)];
//    htmlString = [htmlString stringByAppendingString:@"444555"];
//    htmlString = [htmlString stringByAppendingString:self.newsDetailBall.name.length > 0 ? @"&nbsp;&nbsp;":@""];
//    htmlString = [htmlString stringByAppendingString:@"</span>"];
//    htmlString = [htmlString stringByAppendingString:@"<span style='font-family:PingFang SC Regular;font-size:13px;color:#999999'>"];
//    NSString *time = self.newsDetailBall.created_at;
//    NSString *timeStr = [NSString stringWithFormat:@" · 发布时间: %@",time];
//    if (self.newsDetailBall.source.length==0) {
//        timeStr = [NSString stringWithFormat:@"发布时间: %@",time];
//    }
//    if (time.length>0) {
//        htmlString = [htmlString stringByAppendingString:timeStr];
//    }
    
//    htmlString = [htmlString stringByAppendingString:@"</span>"];
    //内容(字体大小=15)
    htmlString = [htmlString stringByAppendingString:@"<p style='font-family:PingFang SC Medium;font-size:18px;color:#2F2F2F'>"];
    htmlString = [htmlString stringByAppendingString:NonNil(self.newsDetailBall.content)];
    htmlString = [htmlString stringByAppendingString:@"</p>"];
    
    htmlString = [htmlString stringByAppendingString:@"</div></body></html>"];
    NSLog(@"htmlString == \n%@", htmlString);
    //替换windows的换行符为：html换行符
    NSMutableString * showHtmlString = [[NSMutableString alloc] initWithString:htmlString];
    [showHtmlString replaceOccurrencesOfString:@"\r\n" withString:@"<br>" options:NSCaseInsensitiveSearch range:NSMakeRange(0, showHtmlString.length)];
    NSLog(@"%@", showHtmlString);
    return showHtmlString;
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

- (JCDaShangView *)dsView {
    if (!_dsView) {
        _dsView = [JCDaShangView new];
    }
    return _dsView;
}
@end
