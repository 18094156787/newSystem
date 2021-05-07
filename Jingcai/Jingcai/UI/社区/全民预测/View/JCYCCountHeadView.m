//
//  JCYCCountHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCCountHeadView.h"
#import "JCYCRuleWMPageController.h"
@implementation JCYCCountHeadView

- (void)initViews {
    
    [self hg_setCornerOnTopWithRadius:AUTO(12)];
    
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(10));
//        make.width.mas_equalTo(AUTO(140));
        make.height.mas_equalTo(AUTO(18));
    }];
    
    [self addSubview:self.selectBtn];
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.countLab);
        make.size.mas_equalTo(CGSizeMake(90, 24));
    }];

    
    UIImageView *ruleImgView = [UIImageView new];
    ruleImgView.contentMode = UIViewContentModeCenter;
    ruleImgView.userInteractionEnabled = YES;
    ruleImgView.image = JCIMAGE(@"yuce_wh");
    [self addSubview:ruleImgView];
    [ruleImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countLab.mas_right).offset(0);
        make.centerY.equalTo(self.countLab);
        make.width.mas_equalTo(AUTO(30));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    
    UILabel *infoLab = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    infoLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    [self addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countLab);
        make.top.equalTo(self.countLab.mas_bottom).offset(AUTO(10));
    }];
    self.infoLab = infoLab;
    
    
    
    WeakSelf;
    [ruleImgView bk_whenTapped:^{
        JCYCRuleWMPageController *vc = [JCYCRuleWMPageController new];
        vc.settingModel = weakSelf.settingModel;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    
    UIView *lineView = [UIView new];
    [self addSubview:lineView];
    lineView.backgroundColor = COLOR_F0F0F0;
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(1);
    }];
}



- (void)setSettingModel:(JCYuceSettingModel *)settingModel {
    _settingModel = settingModel;
    self.infoLab.text = [NSString stringWithFormat:@"单选大于%@；双选A+B＞%@，A与B≥%@",settingModel.radio_min,settingModel.select_sum,settingModel.select_min];
}

- (void)setCount:(NSString *)count {
    _count = count;
    if ([count integerValue]>0) {
        NSString *string = [NSString stringWithFormat: @"本日还能预测 %@ 次",count];
        NSRange range = [string rangeOfString:count];
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:string];
        [attributedStr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
        self.countLab.attributedText = attributedStr;
    }else{
        self.countLab.text = @"今日预测已用完";
    }

}


- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"今日预测已用完" andFont:0 andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _countLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    }
    return _countLab;;
}

- (UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [UIButton initWithText:@"全部比赛" FontSize:12 BackGroundColor:JCWhiteColor TextColor:COLOR_2F2F2F];
        _selectBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        [_selectBtn setImage:JCIMAGE(@"jc_select_down") forState:0];
        [_selectBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
        [_selectBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 70, 0, 0)];
        _selectBtn.layer.borderWidth = 0.5;
        _selectBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _selectBtn.layer.masksToBounds = YES;
        _selectBtn.layer.cornerRadius = 14;
    }
    return _selectBtn;
}

@end
