//
//  JCActivityKindProgressCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityKindProgressCell.h"

@implementation JCActivityKindProgressCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    self.contentView.backgroundColor = JCClearColor;
    
    [self.contentView addSubview:self.tipBgView];
    [self.tipBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.top.bottom.offset(0);
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"我的积分" andFont:14 andWeight:2 andTextColor:COLOR_FB5835 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.tipBgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12);
        make.top.offset(38);
        make.size.mas_equalTo(CGSizeMake(56, 20));
    }];
    
    float totalWidth = SCREEN_WIDTH-184;
    self.totalWidth = totalWidth;
    UIView *progressBgView = [UIView new];
    [self.tipBgView addSubview:progressBgView];
    progressBgView.layer.cornerRadius = 7;
    progressBgView.layer.masksToBounds = YES;
    progressBgView.backgroundColor = UIColorFromRGB(0xFFE8CA);
    [progressBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(77);
        make.centerY.equalTo(titleLab);
        make.size.mas_equalTo(CGSizeMake(totalWidth, 14));
    }];
    
    [progressBgView addSubview:self.progressView];
    self.progressView.frame = CGRectMake(0, 0, 0, 14);
//    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(0);
//        make.centerY.equalTo(titleLab);
//        make.size.mas_equalTo(CGSizeMake(100, 14));
//    }];
    self.progressView.layer.cornerRadius = 7;
    self.progressView.layer.masksToBounds = YES;
    
    UIImageView *giftImgView = [UIImageView new];
    giftImgView.image = JCIMAGE(@"ic_kind_gift");
    [self.tipBgView addSubview:giftImgView];
    [giftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-12);
        make.centerY.equalTo(titleLab);
        make.size.mas_equalTo(CGSizeMake(42, 42));
    }];
    
    CAGradientLayer *opGl = [CAGradientLayer layer];
    opGl.frame = CGRectMake(0,0,totalWidth,14);
    opGl.startPoint = CGPointMake(0, 0);
    opGl.endPoint = CGPointMake(1, 1);
    opGl.colors = @[(__bridge id)UIColorFromRGB(0xFFA14F).CGColor, (__bridge id)UIColorFromRGB(0xFA4A24).CGColor];
    opGl.locations = @[@(0), @(1.0f)];
    [self.progressView.layer addSublayer:opGl];
    
    [progressBgView addSubview:self.percentLab];
    self.percentLab.frame = CGRectMake(0, 0, 40, 14);

    
    [self.tipBgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(progressBgView.mas_bottom).offset(2);
        make.right.equalTo(progressBgView);
    }];

    [self.tipBgView addSubview:self.numImgView];
    self.numImgView.frame = CGRectMake(77, 8, 76, 34);
    self.numImgView.centerX = self.progressView.right+80;
    
    [self.numImgView addSubview:self.numLab];
    self.numLab.frame = CGRectMake(0, -8, 76, 34);

    
    [self.contentView addSubview:self.resultImgView];
    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(5);
        make.centerX.equalTo(self.contentView);
        make.width.height.mas_equalTo(64);
    }];
    
        
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
//    [self.tipBgView addGestureRecognizer:tap];

}


- (void)tapClick {
    [UIView animateWithDuration:0.5 animations:^{
        
        self.progressView.width = self.progressView.width+10;
        if (self.progressView.width>40) {
            self.percentLab.frame = CGRectMake(self.progressView.width-40, 0, 40, 14);
//            self.numImgView.right = self.percentLab.right+110;
        }else{
//            self.numImgView.right = self.percentLab.right+110;
        }
        self.numImgView.centerX = self.progressView.right+76;
       
    }];
}
- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    if (!detailModel) {
        return;
    }
    _detailModel = detailModel;
    self.countLab.text = [NSString stringWithFormat:@"%@/%@",detailModel.user_info.my_score,detailModel.score];
    NSString *title = [NSString stringWithFormat:@"还差%ld分",[detailModel.score integerValue]-[detailModel.user_info.my_score integerValue]];
    self.numLab.text = title;



    if ([detailModel.score integerValue]==0) {
        //错误数据,分母为 0
        self.progressView.width = 0;
        return;
    }
    float percent = [detailModel.user_info.my_score floatValue]/[detailModel.score floatValue];
    if (percent>1) {
        percent = 1;
        self.numImgView.hidden = YES;
    }
    [UIView animateWithDuration:0.5 animations:^{
        float value = self.totalWidth *percent;
        NSLog(@"%.0f",value);
        self.progressView.width = value;

        self.numImgView.hidden = percent>0.50?NO:YES;
        if (percent>=1) {
            self.numImgView.hidden = YES;
        }
        self.numImgView.centerX = self.progressView.right+76;

    }];
    
    
    if ([self.detailModel.user_info.is_finish integerValue]==1) {
            self.resultImgView.image = JCIMAGE(@"ic_kind_success");
            self.resultImgView.hidden = NO;
    }else{
        if ([self.detailModel.active_state integerValue]==3) {
            //活动已结束
            self.resultImgView.image = JCIMAGE(@"ic_kind_defeat");
            self.resultImgView.hidden = NO;
        }else{
            self.resultImgView.hidden = YES;
        }
        
    }
    

}

- (UIView *)tipBgView {
    if (!_tipBgView) {
        _tipBgView = [UIView new];
        [_tipBgView hg_setAllCornerWithCornerRadius:12];
        _tipBgView.backgroundColor = UIColorFromRGB(0xFFFDFA);
    }
    return _tipBgView;
}

- (UIView *)progressView {
    if (!_progressView) {
        _progressView = [UIView new];
    }
    return _progressView;
}

- (UILabel *)percentLab {
    if (!_percentLab) {
        _percentLab = [UILabel initWithTitle:@"" andFont:12 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _percentLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:12 andWeight:1 andTextColor:COLOR_FB5835 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}
- (UIImageView *)numImgView {
    if (!_numImgView) {
        _numImgView = [UIImageView new];
        _numImgView.image = JCIMAGE(@"ic_kind_bubble");
        _numImgView.hidden = YES;
    }
    return _numImgView;
}
- (UILabel *)numLab {
    if (!_numLab) {
        _numLab = [UILabel initWithTitle:@"" andFont:12 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _numLab;
}

- (UIImageView *)resultImgView {
    if (!_resultImgView) {
        _resultImgView = [UIImageView new];
        _resultImgView.hidden = YES;
    }
    return _resultImgView;
}
@end
