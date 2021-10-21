//
//  JCColumnDerailEmptyFanganCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDerailEmptyFanganCell.h"

@implementation JCColumnDerailEmptyFanganCell

- (void)initViews {
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(168), AUTO(112)));
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).offset(AUTO(8));
        make.centerX.equalTo(self.contentView);
        make.bottom.offset(AUTO(-16));
    }];
}

- (void)data {
//    [self isYushow];
    self.imgView.image = JCIMAGE(@"ic_column_nobuy");
    self.titleLab.text = @"您还未订购该专栏的服务哟~";
}

- (void)isYushow {

}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
    }
    return _imgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}
@end
