//
//  JCImgCollectionViewCell.m
//  FootBallScore
//
//  Created by 陈继伟 on 2020/4/27.
//  Copyright © 2020 --. All rights reserved.
//

#import "JCImgCollectionViewCell.h"

@implementation JCImgCollectionViewCell

- (void)initViews {
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self.contentView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
//    self.imgView.backgroundColor = COLOR_DDDDDD;

}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        [_imgView hg_setAllCornerWithCornerRadius:2];
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imgView;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab  = [UILabel initWithTitle:@"" andFont:AUTO(18) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:[COLOR_000000 colorWithAlphaComponent:0.64] andTextAlignment:NSTextAlignmentCenter];
    }
    return _countLab;
}

@end
