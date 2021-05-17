//
//  JNMatchSJHurtCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJHurtCell.h"
#import "JCWConvertTool.h"
@implementation JNMatchSJHurtCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
        make.top.offset(2);
    }];
    
    bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    bgView.layer.cornerRadius = 5;
    bgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.05].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,2);
    bgView.layer.shadowOpacity = 1;
    bgView.layer.shadowRadius = 4;


    [bgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.centerY.equalTo(bgView);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    [bgView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView).offset(2);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(3));
        make.right.offset(AUTO(-8));
        make.height.mas_equalTo(AUTO(19));
    }];
    
//    [bgView addSubview:self.iconImgView];
//    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.nameLab.mas_bottom);
//        make.left.equalTo(self.nameLab);
//        make.width.height.mas_equalTo(AUTO(12));
//    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab);
        make.top.equalTo(self.nameLab.mas_bottom);
        make.right.offset(AUTO(-8));
    }];
}

- (void)setInjuryBall:(JNMatchInjuryBall *)injuryBall {
    _injuryBall = injuryBall;
    if ([injuryBall.logo containsString:@"http"]) {
        [self.headImgView sd_setImageWithURL:[NSURL URLWithString:injuryBall.logo] placeholderImage:JCIMAGE(@"userImg_default")];
    }else{
        NSString * logoUrl = [NSString stringWithFormat:@"http://cdn.sportnanoapi.com/football/player/%@",injuryBall.logo];
        [self.headImgView sd_setImageWithURL:[NSURL URLWithString:logoUrl] placeholderImage:JCIMAGE(@"userImg_default")];
    }

    self.nameLab.text = NonNil(injuryBall.name);
    self.infoLab.text = NonNil(injuryBall.reason);

}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
         _headImgView.contentMode = UIViewContentModeScaleAspectFill;
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(20)];
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
    }
    return _iconImgView;
}


- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}


@end
