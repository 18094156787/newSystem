//
//  JCHongbaoShowCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/2/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbaoShowCell.h"

@implementation JCHongbaoShowCell

- (void)initViews {

    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.contentView);
    }];
    
//    [self.contentView addSubview:self.indicateImgView];
//    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.contentView);
//        make.right.offset(AUTO(-15));
//        make.size.mas_equalTo(CGSizeMake(AUTO(4), AUTO(8)));
//    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F8F8F8;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

- (void)setModel:(JCWMyHongbaoBall *)model {
    _model = model;
    
//    NSInteger price = model.ta/100;
    NSString *title = [NSString stringWithFormat:@"%@",@(model.total/100.0f)];

    
    if (model.total==0) {
        self.titleLab.text  = @"不使用红包";
    }else{
//        self.titleLab.text  = title;
        self.titleLab.text  = [NSString stringWithFormat:@"%@元红包券(%@)",title,model.end_time];
    }
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}


- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"blue_indicate");
    }
    return _indicateImgView;
}

@end
