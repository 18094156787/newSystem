//
//  JNMatchDetailZRUserCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchDetailZRUserCell.h"

@implementation JNMatchDetailZRUserCell

- (void)initViews {
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self.bgView addSubview:self.numLab];
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.bgView);
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [self.bgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.numLab.mas_right);
        make.centerY.equalTo(self.bgView);
        make.width.height.mas_equalTo(AUTO(24));
    }];
    
    [self.bgView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.bgView);
        make.right.offset(-5);
    }];
}

- (void)setLineupBall:(JNMatchLineupBall *)lineupBall {
    _lineupBall = lineupBall;
    self.numLab.text = NonNil(lineupBall.shirt_number);
    self.nameLab.text = NonNil(lineupBall.name);
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:self.lineupBall.logo] placeholderImage:JCIMAGE(@"userImg_default")];

}

-(UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.layer.borderColor = COLOR_DBDBDB.CGColor;
        _bgView.layer.borderWidth = 0.5;
    }
    return _bgView;
}

- (UILabel *)numLab {
    if (!_numLab) {
        _numLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _numLab;
}

-(UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.image = JCIMAGE(@"userImg_default");
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}
@end
