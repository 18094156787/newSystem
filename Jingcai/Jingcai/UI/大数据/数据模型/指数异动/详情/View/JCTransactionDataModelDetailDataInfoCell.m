//
//  JCTransactionDataModelDetailDataInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelDetailDataInfoCell.h"

@implementation JCTransactionDataModelDetailDataInfoCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.width.mas_equalTo(AUTO(70));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.windRateLab];
    [self.windRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(AUTO(10));
        make.centerY.equalTo(self.titleLab);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [self.contentView addSubview:self.upImgView];
    [self.upImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.windRateLab.mas_right);
        make.centerY.equalTo(self.titleLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];
    
    [self.contentView addSubview:self.equalRateLab];
    [self.equalRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.upImgView.mas_right);
        make.centerY.equalTo(self.titleLab);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [self.contentView addSubview:self.equalImgView];
    [self.equalImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.equalRateLab.mas_right);
        make.centerY.equalTo(self.titleLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];
    
    [self.contentView addSubview:self.loseRateLab];
    [self.loseRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.equalImgView.mas_right);
        make.centerY.equalTo(self.titleLab);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [self.contentView addSubview:self.downImgView];
    [self.downImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loseRateLab.mas_right);
        make.centerY.equalTo(self.titleLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.titleLab);
    }];
}

- (void)data {
    self.titleLab.text = @"首次异动";
    self.upImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_up");
    self.equalImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_down");
    self.downImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_down");
    self.windRateLab.text = @"3.99";
    self.equalRateLab.text = @"3.99";
    self.loseRateLab.text = @"3.99";
    self.infoLab.text = @"主胜指数升 40%";
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)windRateLab {
    if (!_windRateLab) {
        _windRateLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _windRateLab;
}

- (UILabel *)equalRateLab {
    if (!_equalRateLab) {
        _equalRateLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _equalRateLab;
}

- (UILabel *)loseRateLab {
    if (!_loseRateLab) {
        _loseRateLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseRateLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

- (UIImageView *)upImgView {
    if (!_upImgView) {
        _upImgView = [UIImageView new];
    }
    return _upImgView;
}

- (UIImageView *)equalImgView {
    if (!_equalImgView) {
        _equalImgView = [UIImageView new];
    }
    return _equalImgView;
}

- (UIImageView *)downImgView {
    if (!_downImgView) {
        _downImgView = [UIImageView new];
    }
    return _downImgView;
}

@end
