//
//  JCActivityGuessResultItemCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuessResultItemCell.h"

@implementation JCActivityGuessResultItemCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    self.headImgView = [UIImageView new];
    self.headImgView.backgroundColor = [JCWhiteColor colorWithAlphaComponent:0.9];
    [self.headImgView hg_setAllCornerWithCornerRadius:25];
    [bgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.centerX.equalTo(bgView);
        make.width.height.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.equalTo(self.headImgView.mas_bottom).offset(3);
    }];
    

}


- (void)setModel:(JCActivityOptionModel *)model {
    _model = model;

    self.infoLab.text = model.name;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
}



- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:12 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

@end
