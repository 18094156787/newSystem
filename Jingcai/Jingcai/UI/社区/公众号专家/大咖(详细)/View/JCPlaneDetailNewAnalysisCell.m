//
//  JCPlaneDetailNewAnalysisCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailNewAnalysisCell.h"

@implementation JCPlaneDetailNewAnalysisCell

- (void)initViews {
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(16);
        make.right.offset(AUTO(-15));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = JCBaseColor;
    [self.bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    

    
    UILabel *label = [UILabel initWithTitle:@"赛事解析" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(lineView);
    }];
    self.infoLab = label;
    
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom).offset(AUTO(15));
        make.left.equalTo(self.contentView).offset(AUTO(15));
        make.right.equalTo(self.contentView).offset(AUTO(-15));
        make.bottom.offset(AUTO(-20));
        
    }];
}

- (void)setPlanDetailModel:(JCWTjInfoBall *)planDetailModel {
    _planDetailModel = planDetailModel;
    self.infoLab.text = @"方案详情";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 6; // 设置行间距
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:planDetailModel.content attributes:@{NSParagraphStyleAttributeName: paragraphStyle}];
    self.contentLab.attributedText = attributedStr;
    self.bgView.hidden = planDetailModel.content.length==0?YES:NO;
    if (planDetailModel.content.length==0) {
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        
        [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(AUTO(15));
        }];
    }else{
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(16);
        }];
        
        [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(AUTO(-20));
        }];
    }
    
//    self.contentLab.text = @"设置行间距1设置行间距2设置行间距3设置行间距4设置行间距5";
}


- (void)setFreeDetailModel:(JCWTjInfoBall *)freeDetailModel {
    _freeDetailModel = freeDetailModel;
    if (!freeDetailModel) {
        return;
    }
    self.infoLab.text = @"赛事解析";
    if (freeDetailModel.analyse.length>0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 6; // 设置行间距
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:freeDetailModel.analyse attributes:@{NSParagraphStyleAttributeName: paragraphStyle}];
        self.contentLab.attributedText = attributedStr;
    }

    self.bgView.hidden = freeDetailModel.analyse.length==0?YES:NO;
    if (freeDetailModel.analyse.length==0) {
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        
        [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(AUTO(15));
        }];
    }else{
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(16);
        }];
        
        [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(AUTO(-20));
        }];
    }
}



- (void)setTjModel:(JCGZHTuiJianModel *)tjModel {
    _tjModel = tjModel;
    self.infoLab.text = @"赛事解析";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 6; // 设置行间距
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:NonNil(tjModel.analysis) attributes:@{NSParagraphStyleAttributeName: paragraphStyle}];
    self.contentLab.attributedText = attributedStr;
    self.bgView.hidden = tjModel.analysis.length==0?YES:NO;
    if (tjModel.analysis.length==0) {
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        
        [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(AUTO(15));
        }];
    }else{
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(16);
        }];
        
        [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(AUTO(-20));
        }];
    }
    
    
}

- (void)setContent:(NSString *)content {
    _content = content;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 6; // 设置行间距
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:NonNil(content) attributes:@{NSParagraphStyleAttributeName: paragraphStyle}];
    self.contentLab.attributedText = attributedStr;
    self.bgView.hidden = content.length==0?YES:NO;
    if (content.length==0) {
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        
        [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(AUTO(15));
        }];
    }else{
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(16);
        }];
        
        [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(AUTO(-20));
        }];
    }
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel labelTitle:@"" andFont:AUTO(15) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}

@end
