//
//  JCCoinRecordsTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/10/24.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCCoinRecordsTableViewCell.h"

@implementation JCCoinRecordsTableViewCell

- (void)initViews {
    [self.contentView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(44));
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(7));
        make.top.equalTo(self.iconImgView).offset(2);
        make.height.mas_equalTo(AUTO(20));
        make.right.offset(AUTO(-80));
    }];
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(7));
        make.top.equalTo(self.titleLab.mas_bottom).offset(2);
    }];
    
    [self.contentView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)setRecordBall:(JCWCoinRecordBall *)recordBall {
    _recordBall = recordBall;
    self.titleLab.text = recordBall.title;
    self.timeLab.text = recordBall.created_at;
    float money = [recordBall.num floatValue];
    NSString *value = @"-";
    if (recordBall.is_income==1) {
        value= @"+";
    }
    self.priceLab.text = [NSString stringWithFormat:@"%@%@",value,@(money)];

    if (recordBall.icon_type==1||recordBall.icon_type==6) {
        self.iconImgView.image = JCIMAGE(@"icon-gm");

    }
    if (recordBall.icon_type==2) {
        self.iconImgView.image = JCIMAGE(@"icon-tk");
    }
    if (recordBall.icon_type==3) {
        self.iconImgView.image = JCIMAGE(@"icon-cz");
    }

    if (recordBall.icon_type==4) {
        self.iconImgView.image = JCIMAGE(@"icon-zs");
    }
    if (recordBall.icon_type==5) {
        self.iconImgView.image = JCIMAGE(@"icon-gq");
    }
    if (recordBall.icon_type==7) {
        //打赏
        self.iconImgView.image = JCIMAGE(@"icon-ds");
    }

}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        [_iconImgView hg_setAllCornerWithCornerRadius:AUTO(22)];
    }
    return _iconImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

@end
