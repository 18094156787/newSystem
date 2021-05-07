//
//  JCPlaneDetailInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/11.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCPlaneDetailInfoCell.h"

@implementation JCPlaneDetailInfoCell


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
    
    UILabel *label = [UILabel initWithTitle:@"方案详情" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(self.bgView);
    }];
    
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom).offset(AUTO(15));
        make.left.equalTo(self.contentView).offset(AUTO(16));
        make.right.equalTo(self.contentView).offset(AUTO(-16));
        
    }];
    
    self.analyseBgView = [UIView new];
    [self.contentView addSubview:self.analyseBgView];
    [self.analyseBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(16));
    }];
//    self.analyseBgView = analyseBgView;
    
    UIView *lineView1 = [UIView new];
    lineView1.backgroundColor = JCBaseColor;
    [self.analyseBgView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.analyseBgView);
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    
    UILabel *label1 = [UILabel initWithTitle:@"赛事解析" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.analyseBgView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(self.analyseBgView);
    }];
    
    [self.contentView addSubview:self.analyseLab];
    [self.analyseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.analyseBgView.mas_bottom).offset(AUTO(15));
        make.left.equalTo(self.contentView).offset(AUTO(16));
        make.right.equalTo(self.contentView).offset(AUTO(-16));
    }];
    
//    [self.contentView addSubview:self.lineView];
//    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.right.offset(AUTO(-15));
//        make.top.equalTo(self.analyseLab.mas_bottom).offset(AUTO(15));
//        make.height.mas_equalTo(0.5);
//    }];
//
//    [self.contentView addSubview:self.resultLab];
//    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.right.offset(AUTO(-15));
//        make.top.equalTo(self.lineView.mas_bottom).offset(AUTO(15));
//    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.analyseLab.mas_bottom).offset(AUTO(10));
//        make.centerX.equalTo(self.contentView);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(AUTO(-10));
    }];

}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(14) andWeight:0 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}


- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel labelTitle:@"" andFont:AUTO(18) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UILabel *)analyseLab {
    if (!_analyseLab) {
        _analyseLab = [UILabel labelTitle:@"" andFont:AUTO(15) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _analyseLab.numberOfLines = 0;
    }
    return _analyseLab;
}

- (void)setPlanDetailModel:(JCWTjInfoBall *)planDetailModel {
    if (!planDetailModel) {
        return;
    }
    _planDetailModel = planDetailModel;

    self.titleLab.text = planDetailModel.subtitle;
    
//    planDetailModel.content = @"";
    if (self.planDetailModel.sf_type==2) {
        //免费
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabel:)];
        [self addGestureRecognizer:tap];
        if (self.planDetailModel.content.length>0) {
            
            NSAttributedString *htmlStr = [self attrHtmlStringFrom:self.planDetailModel.content];
            self.contentLab.attributedText = htmlStr;
            self.htmlStr =  htmlStr;
        }else{
            self.contentLab.text = @"";
        }
        if (planDetailModel.analyse.length==0) {
            self.analyseBgView.hidden = YES;
            [self.analyseBgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
            
//            [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self.analyseLab.mas_bottom).offset(AUTO(-30));
//            }];
        }
        self.analyseLab.text = planDetailModel.analyse;
        
//        self.lineView.hidden = YES;
        
        [self.infoLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.analyseLab.mas_bottom).offset(AUTO(-10));
        }];
        


    }else {
        self.infoLab.text = @"";
        if (self.planDetailModel.content.length>0) {
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineSpacing = 6; // 设置行间距
            NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self.planDetailModel.content attributes:@{NSParagraphStyleAttributeName: paragraphStyle}];
            self.contentLab.attributedText = attributedStr;
            
        }else{
            self.contentLab.text = self.planDetailModel.content;
            }
        self.analyseLab.text = planDetailModel.analyse;
        
        
        if (planDetailModel.subtitle.length==0) {
            [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLab.mas_bottom).offset(0);
            }];
        }
        if (planDetailModel.content.length==0) {
            self.bgView.hidden = YES;
            [self.analyseBgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(-15));
            }];
            
        }
        if (planDetailModel.analyse.length==0) {
            self.analyseBgView.hidden = YES;
            [self.infoLab mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.analyseLab.mas_bottom).offset(0);
            }];
        }
        
//        if (planDetailModel.is_end==1) {
//            if (planDetailModel.zhong.length>0) {
//                self.resultLab.textColor = JCBaseColor;
//                self.resultLab.text = planDetailModel.zhong;
//            }else{
//                self.resultLab.text = @"待定";
//                self.resultLab.textColor = COLOR_30B27A;
//            }
//        }else{
//            [self.infoLab mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self.resultLab.mas_bottom).offset(AUTO(-15));
//            }];
//            self.lineView.hidden = YES;
//
//        }
        
    }
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
 
    NSString *headStr = [NSString stringWithFormat:@"<head><style>img{max-width:%f !important;height:auto}</style></head>", SCREEN_WIDTH-AUTO(30)];
//    str = [str stringByAppendingString:@"\n\n\n\n"];
    str = [NSString stringWithFormat:@"%@<html><meta content=\"width=device-width, initial-scale=1.0, maximum-scale=3.0, user-scalable=0; \" name=\"viewport\" /><body style=\"overflow-wrap:break-word;word-break:break-all;white-space: normal; font-size:18px; color:#333333; \">%@</body></html>",headStr,str];
    NSAttributedString *attrStr=  [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:@(NSUTF8StringEncoding)} documentAttributes:nil error:nil];
    return attrStr;
}

 - (CGRect)boundingRectForCharacterRange:(NSRange)range{
     NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:self.htmlStr];
     NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
     [textStorage addLayoutManager:layoutManager];
     NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:[self.contentLab bounds].size];
     
     textContainer.lineFragmentPadding = 0;
     [layoutManager addTextContainer:textContainer];
     NSRange glyphRange;
     [layoutManager characterRangeForGlyphRange:range actualGlyphRange:&glyphRange];
     CGRect rect = [layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:textContainer];
     return rect;
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

//- (UIView *)lineView {
//    if (!_lineView) {
//        _lineView = [UIView new];
//        _lineView.backgroundColor = COLOR_DBDBDB;
//    }
//    return _lineView;
//}
//
//- (UILabel *)resultLab {
//    if (!_resultLab) {
//        _resultLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
//        _resultLab.numberOfLines = 0;
//    }
//    return _resultLab;
//}



@end
