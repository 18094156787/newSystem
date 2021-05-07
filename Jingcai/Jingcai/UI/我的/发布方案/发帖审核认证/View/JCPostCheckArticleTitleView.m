//
//  JCPostCheckArticleTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckArticleTitleView.h"

@implementation JCPostCheckArticleTitleView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.editView];
    [self.editView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(AUTO(100));
    }];
    
    UILabel *editLab = [UILabel initWithTitle:@"去修改" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];;
    [self.editView addSubview:editLab];
    [editLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.editView);
        make.right.offset(0);
    }];
    
//    UIImageView *editImgView = [UIImageView new];
//    editImgView.image = JCIMAGE(@"post_ic_qxg");
//    [self.editView addSubview:editImgView];
//    [editImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(editLab.mas_left).offset(-2);
//        make.centerY.equalTo(self.editView);
//        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
//    }];
//    
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIView *)editView {
    if (!_editView) {
        _editView = [UIView new];
    }
    return _editView;
}

@end
