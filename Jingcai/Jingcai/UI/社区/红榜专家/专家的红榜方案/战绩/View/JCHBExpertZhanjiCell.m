//
//  JCHBExpertZhanjiCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHBExpertZhanjiCell.h"

@implementation JCHBExpertZhanjiCell

- (void)initViews {
    [self.contentView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.contentView);
    }];
    
}

- (void)setModel:(JCCommunityEventModel *)model {
    _model = model;
    NSString *hongString = [NSString stringWithFormat:@"%@红",model.win];
    NSString *heiString = [NSString stringWithFormat:@"%@黑",model.lose];
    NSString *zouString = [NSString stringWithFormat:@"%@走",model.equal];
    NSString *zsString = [NSString stringWithFormat:@"%@ %@ %@ %@",model.competition_name,hongString,zouString,heiString];

    
    
    NSMutableAttributedString *zsAttr = [[NSMutableAttributedString alloc] initWithString:zsString];
    NSRange hong_range = [zsString rangeOfString:hongString];
    if (hong_range.location!=NSNotFound) {
        [zsAttr addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:hong_range];
    }
    NSRange zou_range = [zsString rangeOfString:zouString];
    if (zou_range.location!=NSNotFound) {
        [zsAttr addAttribute:NSForegroundColorAttributeName value:COLOR_2655B3 range:zou_range];
    }
    NSRange hei_range = [zsString rangeOfString:heiString];
    if (hei_range.location!=NSNotFound) {
        [zsAttr addAttribute:NSForegroundColorAttributeName value:COLOR_505050 range:hei_range];
    }
    self.titleLab.attributedText = zsAttr;
    if ([model.type integerValue]==1) {
        self.infoLab.text = [NSString stringWithFormat:@"%@%%",model.profit];
    }else{
        self.infoLab.text = [NSString stringWithFormat:@"%@%%",model.target];
    }

    
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
    }
    return _iconImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

@end
