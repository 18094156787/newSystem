//
//  JCPlaneDetailInfo_MFCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailInfo_MFCell.h"

@implementation JCPlaneDetailInfo_MFCell

- (void)initViews {
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(AUTO(15));
        make.left.equalTo(self.contentView).offset(AUTO(16));
        make.right.equalTo(self.contentView).offset(AUTO(-16));
    }];
    
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(16));
    }];

    UIView *lineView = [UIView new];
    lineView.backgroundColor = JCBaseColor;
    [self.bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];

    UILabel *label = [UILabel initWithTitle:@"方案详情" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(self.bgView);
    }];

    [self.contentView addSubview:self.webView];
//    self.webView.frame = CGRectMake(AUTO(15), 50, SCREEN_WIDTH-AUTO(30), 100);
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom).offset(AUTO(30));
        make.left.offset(AUTO(15));
        make.width.mas_equalTo(SCREEN_WIDTH-AUTO(30));
//        make.bottom.equalTo(self.bgView).offset(0);
        make.height.mas_equalTo(50);
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(AUTO(-50));
    }];
    

//
//
//
//
//
//
//    [self.contentView addSubview:self.infoLab];
//    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.webView.mas_bottom).offset(AUTO(10));
////        make.centerX.equalTo(self.contentView);
//        make.left.offset(AUTO(15));
//        make.right.offset(AUTO(-15));
////        make.bottom.equalTo(self.contentView.mas_bottom).offset(AUTO(-10));
//    }];

}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(14) andWeight:0 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
        _titleLab.hidden = YES;
    }
    return _titleLab;
}




- (void)setPlanDetailModel:(JCWTjInfoBall *)planDetailModel {
    _planDetailModel = planDetailModel;
    
    self.titleLab.text = planDetailModel.subtitle;

    
    if (self.planDetailModel.sf_type==2) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabel:)];
        [self addGestureRecognizer:tap];
        if (self.planDetailModel.content.length>0) {
            NSAttributedString *htmlStr = [self attrHtmlStringFrom:self.planDetailModel.content];
//            self.contentLab.attributedText = htmlStr;
            self.htmlStr =  htmlStr;
            [self.webView loadHTMLString:[self htmlWithContent:self.planDetailModel.content] baseURL:nil];
//             [self.webView sizeToFit];
        }else{
//            self.contentLab.text = @"";
        }

    }else {
//        if (self.planDetailModel.content.length>0) {
//            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//            paragraphStyle.lineSpacing = 6; // 设置行间距
//            NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self.planDetailModel.content attributes:@{NSParagraphStyleAttributeName: paragraphStyle}];
//            self.contentLab.attributedText = attributedStr;
//            self.infoLab.text = @"";
//        }else{
//            self.contentLab.text = self.planDetailModel.content;
//            }
    }
}

- (CGSize)returnTextWidth:(NSString *)text size:(CGSize)size font:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return textSize;
}

- (void)tapLabel:(UITapGestureRecognizer *)sender{
    CGPoint point = [sender locationInView:self.contentView];
NSLog(@"handleSingleTap!pointx:%f,y:%f",point.x,point.y);
    [self getImageModelsWithHtmlStr:self.htmlStr];
}

- (void)getImageModelsWithHtmlStr:(NSAttributedString *)htmlStr{
    __weak typeof(self) weakSelf = self;
    NSMutableArray *arr = [NSMutableArray array];
    [htmlStr enumerateAttributesInRange:NSMakeRange(0, htmlStr.length) options:(NSAttributedStringEnumerationLongestEffectiveRangeNotRequired) usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        
        if ([attrs objectForKey:NSAttachmentAttributeName]) {
            
            NSTextAttachment *attachement = [attrs objectForKey:NSAttachmentAttributeName];
            CGRect rect = [self boundingRectForCharacterRange:range];
            NSLog(@"===========%@",NSStringFromCGRect(rect));
            UIImage *image =  [UIImage imageWithData:attachement.fileWrapper.regularFileContents];
            [arr addObject:image];
//            MSHTMLImgModel *model = [MSHTMLImgModel new];
//            model.rect = rect;
//            // 获取附件image
//            model.image = [UIImage imageWithData:attachement.fileWrapper.regularFileContents] ;
//            [arr addObject:model];
        }
        
//        if (range.location + range.length == htmlStr.length){
//            weakSelf.arr = arr;
//        }
    }];
    
    if (self.JCImageBlock&&arr.count>0) {
        self.JCImageBlock(arr);
    }
}

/** 解析成html的富文本 */
- (NSAttributedString *)attrHtmlStringFrom:(NSString *)str {
 
//    NSString *headStr = [NSString stringWithFormat:@"<head><style>img{max-width:%f !important;height:auto}</style></head>", SCREEN_WIDTH-AUTO(30)];
//    str = [str stringByAppendingString:@"\n\n\n\n"];
//    str = [NSString stringWithFormat:@"%@<html><meta content=\"width=device-width, initial-scale=1.0, maximum-scale=3.0, user-scalable=0; \" name=\"viewport\" /><body style=\"overflow-wrap:break-word;word-break:break-all;white-space: normal; font-size:15px; color:#333333; \">%@</body></html>",headStr,str];
        str = [NSString stringWithFormat:@"<html>%@</html>",str];

    NSAttributedString *attrStr=  [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:@(NSUTF8StringEncoding)} documentAttributes:nil error:nil];
//    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:str];
    return attrStr;
}



 - (CGRect)boundingRectForCharacterRange:(NSRange)range{
     NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:self.htmlStr];
     NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
     [textStorage addLayoutManager:layoutManager];
     NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:[self.webView bounds].size];
     
     textContainer.lineFragmentPadding = 0;
     [layoutManager addTextContainer:textContainer];
     NSRange glyphRange;
     [layoutManager characterRangeForGlyphRange:range actualGlyphRange:&glyphRange];
     CGRect rect = [layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:textContainer];
     return rect;
 }
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    [webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable result,NSError *_Nullable error) {
        //获取页面高度
        CGFloat scrollHeight = [result doubleValue];
        NSLog(@"scrollHeight 即为所求：%f",scrollHeight);
            [self.webView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(scrollHeight);

            }];
        if (self.height==0) {
            if (self.JCRefreshBlock) {
                CGSize titleSize =   [self returnTextWidth:self.planDetailModel.subtitle size:CGSizeMake(SCREEN_WIDTH-AUTO(30), 1000) font:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)]];
               self.height = scrollHeight+AUTO(80)+titleSize.height;
                self.JCRefreshBlock(self.height);
                self.titleLab.hidden = NO;
                }
        }

    }];
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

-(UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"免责声明：鲸猜足球仅为信息发布平台，并不对第三方发布的信息真实性及准确性负责，且不提供彩票售卖服务，请您注意投资风险，理性购买！" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];//专家观点不代表本APP
        _infoLab.numberOfLines = 0;
    }
    return _infoLab;
}
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
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

@end
