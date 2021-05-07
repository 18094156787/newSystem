//
//  JCTeamDetailZhuanHuiCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailZhuanHuiCell.h"
#import "JCTeamDetailZhuanHuiWMVC.h"
@implementation JCTeamDetailZhuanHuiCell

- (void)initViews {
    [self.contentView addSubview:self.inView];
    [self.inView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.contentView);
        make.right.equalTo(self.mas_centerX);
    }];
    
    [self.contentView addSubview:self.outView];
    [self.outView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.mas_centerX);
    }];
    
    self.inView.titleLab.textColor = COLOR_6DD400;
    self.outView.titleLab.textColor = COLOR_F7B500;
    self.inView.imgView.image= JCIMAGE(@"mathchTeam_icon_zr");
    self.outView.imgView.image= JCIMAGE(@"mathchTeam_icon_zc");
    WeakSelf;
    [self.inView bk_whenTapped:^{
        JCTeamDetailZhuanHuiWMVC *vc = [JCTeamDetailZhuanHuiWMVC new];
        vc.team_id = weakSelf.team_id;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    
    [self.outView bk_whenTapped:^{
        JCTeamDetailZhuanHuiWMVC *vc = [JCTeamDetailZhuanHuiWMVC new];
        vc.team_id = weakSelf.team_id;
        vc.selectIndex = 1;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
}

- (void)setZhuanRuModel:(JCTeamDetailInfoZhuanHuiModel *)zhuanRuModel {
    _zhuanRuModel = zhuanRuModel;
    self.inView.titleLab.textColor = COLOR_30B27A;
    if ([zhuanRuModel.player_count integerValue]>0) {
        self.inView.titleLab.text = [NSString stringWithFormat:@"转入(%@)",zhuanRuModel.player_count];
    }else{
        self.inView.titleLab.text = @"转入";
    }
    
    self.inView.model = zhuanRuModel;
    
}

- (void)setZhuanChuModel:(JCTeamDetailInfoZhuanHuiModel *)zhuanChuModel {
    _zhuanChuModel = zhuanChuModel;
    self.outView.titleLab.textColor = JCBaseColor;
    if ([zhuanChuModel.player_count integerValue]>0) {
        self.outView.titleLab.text = [NSString stringWithFormat:@"转出(%@)",zhuanChuModel.player_count];
    }else{
        self.outView.titleLab.text = @"转出";
    }
    self.outView.model = zhuanChuModel;
    
}

- (JCTeamDetailZhuanHuiItemView *)inView {
    if (!_inView) {
        _inView = [JCTeamDetailZhuanHuiItemView new];
    }
    return _inView;
}

- (JCTeamDetailZhuanHuiItemView *)outView {
    if (!_outView) {
        _outView = [JCTeamDetailZhuanHuiItemView new];
    }
    return _outView;
}

@end
