//
//  JCTeamMatchWMStickHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchWMStickHeadView.h"

@implementation JCTeamMatchWMStickHeadView

- (void)initViews {
    UIImageView *imgBgView = [UIImageView new];
    imgBgView.image = JCIMAGE(@"match_top_bg");
    [self addSubview:imgBgView];
    [imgBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [imgBgView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.offset(kNavigationBarHeight+15);
        make.width.height.mas_equalTo(70);
    }];
}

- (void)setEventInfoModel:(JCDataBaseEventBaseModel *)eventInfoModel {
    _eventInfoModel = eventInfoModel;
//    eventInfoModel.logo = @"22";
    if (self.isTeam) {
        [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:eventInfoModel.logo] placeholderImage:JCIMAGE(@"icon_qd_zq_default")];
    }else{
        [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:eventInfoModel.logo] placeholderImage:JCIMAGE(@"icon_ls_default")];
    }
    

}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.contentMode = UIViewContentModeScaleAspectFit;
//        _iconImgView.backgroundColor = JCWhiteColor;
//        [_iconImgView hg_setAllCornerWithCornerRadius:35];
    }
    return _iconImgView;
}

@end
