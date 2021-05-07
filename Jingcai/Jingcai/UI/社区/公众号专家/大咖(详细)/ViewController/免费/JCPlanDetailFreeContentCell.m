//
//  JCPlanDetailFreeContentCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/14.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPlanDetailFreeContentCell.h"
#import "JCWDateTool.h"
#import "YBImageBrowser.h"
@implementation JCPlanDetailFreeContentCell

- (void)initViews {
        [self.contentView addSubview:self.webView];
//        self.webView.frame = CGRectMake(AUTO(15), 0, SCREEN_WIDTH-AUTO(30), 100);
        [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.left.offset(AUTO(15));
            make.width.mas_equalTo(SCREEN_WIDTH-AUTO(30));
//            make.bottom.offset(AUTO(-50));
            make.height.mas_equalTo(100);
//            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        }];
    
}

- (void)setPlanDetailModel:(JCWTjInfoBall *)planDetailModel {
    _planDetailModel = planDetailModel;
    if (!planDetailModel) {
        return;
    }
    if (self.loadSuccess&&planDetailModel) {
        return;
    }

    NSString *headStr = [NSString stringWithFormat:@"<head><style>img{max-width:%f !important;height:auto}</style></head>", SCREEN_WIDTH];
//    str = [str stringByAppendingString:@"\n\n\n\n"];
    NSString  * str = [NSString stringWithFormat:@"%@<html><meta content=\"width=device-width, initial-scale=1.0, maximum-scale=3.0, user-scalable=0; \" name=\"viewport\" /><body style=\"overflow-wrap:break-word;word-break:break-all;white-space: normal; font-size:18px; color:#333333; \">%@</body></html>",headStr,self.planDetailModel.content];
    
    [self.webView loadHTMLString:str baseURL:nil];
}


- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
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
        if (self.height==0) {

            if (self.JCRefreshBlock) {
//                CGSize titleSize =   [self returnTextWidth:self.planDetailModel.subtitle size:CGSizeMake(SCREEN_WIDTH-AUTO(30), 1000) font:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)]];
                self.height = scrollHeight;
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
        data.imageURL = [NSURL URLWithString:url];
        [datas addObject:data];
    }];


    YBImageBrowser *browser = [YBImageBrowser new];
    browser.shouldHideStatusBar = NO;
    browser.dataSourceArray = datas;
    browser.currentPage = index;
    [browser show];
}

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [WKWebView new];
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
        _webView.navigationDelegate = self;
        
        _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _webView.scrollView.scrollEnabled = NO;
//        _webView.userInteractionEnabled = NO;
        if (@available(iOS 11.0, *)) {
            _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            
//            self.webView.edgesForExtendedLayout = UIRectEdgeNone;
            // Fallback on earlier versions
        }
//        _webView.contentScaleFactor = 1;
    }
    return _webView;
}

@end
