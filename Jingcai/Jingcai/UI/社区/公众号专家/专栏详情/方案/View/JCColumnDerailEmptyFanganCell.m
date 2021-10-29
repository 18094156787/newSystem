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
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = COLOR_F0F0F0;
    [self.contentView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(AUTO(8));
    }];
}

- (void)setModel:(JCColumnListPlanModel *)model {
    _model = model;
    //状态,0未购买,1预售即将开始,2预售中(已购买),3更新中,4周期结束，5预售中未购买
    if ([model.status integerValue]==1) {
        self.imgView.image = JCIMAGE(@"ic_column_begin");
        self.titleLab.text = @"该周期即将发售，请耐心等待~";
    }
    if ([model.status integerValue]==2) {
        self.imgView.image = JCIMAGE(@"ic_column_update");
        self.titleLab.text = @"方案尚未更新，请耐心等待~";
    }
    if ([model.status integerValue]==3) {
        self.imgView.image = JCIMAGE(@"ic_column_update");
        self.titleLab.text = @"方案尚未更新，请耐心等待~";
    }
    if ([model.status integerValue]==5) {
        self.imgView.image = JCIMAGE(@"ic_column_nobuy");
        self.titleLab.text = @"您还未订购该专栏的服务哟~";
    }

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
