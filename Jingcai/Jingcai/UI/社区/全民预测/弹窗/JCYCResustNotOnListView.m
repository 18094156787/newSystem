//
//  JCYCResustNotOnListView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCResustNotOnListView.h"

@implementation JCYCResustNotOnListView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    UIImageView *bgView = [UIImageView new];
    bgView.image = JCIMAGE(@"yc_tip_fail");
    bgView.userInteractionEnabled = YES;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(0)+kNavigationBarHeight);
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.height.mas_equalTo(AUTO(480));
    }];


    [bgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.offset(AUTO(113));
        make.size.mas_equalTo(CGSizeMake(AUTO(68), AUTO(68)));
    }];
    
    [bgView addSubview:self.qyImgView];
    [self.qyImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(-10));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(15)));
    }];
    
    [bgView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(15));
    }];
    
    self.label = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [bgView addSubview:self.label];
    self.label.numberOfLines = 3;
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(30));
        make.centerX.equalTo(bgView);
        make.height.mas_equalTo(AUTO(100));
    }];

    UIButton *shareBtn = [UIButton initWithText:@"再接再厉" FontSize:AUTO(16) BackGroundColor:COLOR_EF2F2F TextColors:JCWhiteColor];
    shareBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    [bgView addSubview:shareBtn];
    [shareBtn hg_setAllCornerWithCornerRadius:AUTO(26)];
    [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(250), AUTO(46)));
    }];
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"yc_tip_close") forState:0];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_bottom).offset(AUTO(15));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(50)));
    }];
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        if (weakSelf.JCCloseBlock) {
            weakSelf.JCCloseBlock();
        }
    }];
    
    [shareBtn bk_whenTapped:^{
        if (weakSelf.JCCloseBlock) {
              weakSelf.JCCloseBlock();
          }
    }];
//    [self data];
}

//- (void)data {
//    self.headImgView.backgroundColor = COLOR_F0F0F0;
//    self.nameLab.text = @"杰克船长008";
//    self.infoLab.text = @"上周 6 连红 | 中13场";
//
//    NSString *string = @"抱歉 !\n上周战绩不达标\n离现金大奖仅一步之遥";
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    [paragraphStyle setAlignment:NSTextAlignmentCenter];
//    paragraphStyle.lineSpacing = 5; // 设置行间距
//    NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:string];
//    [atext addAttributes:@{NSParagraphStyleAttributeName: paragraphStyle} range:string.rangeOfAll];
//    self.label.attributedText = atext;
//
//}
- (void)setWeekResultModel:(JCYuCeWeekResultModel *)weekResultModel {
    _weekResultModel = weekResultModel;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:weekResultModel.user_info.user_img]];
    self.nameLab.text = weekResultModel.user_info.user_name;
    self.infoLab.text = [NSString stringWithFormat:@"上周 %@ 连红 | 中%@场",weekResultModel.lianhong,weekResultModel.mingzhong];
     self.qyImgView.hidden = [weekResultModel.top integerValue]==1?NO:YES;
    
    NSString *string = @"抱歉 !\n上周战绩不达标\n离现金大奖仅一步之遥";
     NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
     [paragraphStyle setAlignment:NSTextAlignmentCenter];
     paragraphStyle.lineSpacing = 5; // 设置行间距
     NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:string];
     [atext addAttributes:@{NSParagraphStyleAttributeName: paragraphStyle} range:string.rangeOfAll];
     self.label.attributedText = atext;

}




- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(34)];
    }
    return _headImgView;
}

- (UIImageView *)qyImgView {
    if (!_qyImgView) {
        _qyImgView = [UIImageView new];
        _qyImgView.image = JCIMAGE(@"jc_qianyue_tag");
    }
    return _qyImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}


@end
