//
//  JCFootBallNormalHeadCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/17.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCFootBallNormalHeadCell.h"

@implementation JCFootBallNormalHeadCell

- (void)initViews {
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.backgroundColor = COLOR_F3F3F3;
        [_imgView hg_setAllCornerWithCornerRadius:AUTO(15)];
    }
    return _imgView;
}

@end
