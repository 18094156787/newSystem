//
//  JCQR_CollectionViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCQR_CollectionViewCell.h"

@implementation JCQR_CollectionViewCell

- (void)initViews {
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
//    [self.contentView addSubview:self.errorLab];
//    [self.errorLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsZero);
//    }];
    
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



@end
