//
//  JCYCFriendHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCFriendHeadView.h"
#import "JCInviteFriendCycleCell.h"
@implementation JCYCFriendHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F75050;
    UIImageView *topBgView = [UIImageView new];
    topBgView.image = JCIMAGE(@"jc_invite_top");
    topBgView.userInteractionEnabled = YES;
    [self addSubview:topBgView];
    [topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(kNavigationBarHeight+170);
    }];
    
    UIImageView *bottomBgView = [UIImageView new];
    bottomBgView.image = JCIMAGE(@"jc_invite_bottom");
    bottomBgView.userInteractionEnabled = YES;
    [self addSubview:bottomBgView];
    [bottomBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(topBgView.mas_bottom);
        make.height.mas_equalTo(AUTO(230));
    }];

    
    self.jingcaiCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(60, 90, SCREEN_WIDTH-120, 60) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.jingcaiCycleScrollView.clipsToBounds = YES;
    self.jingcaiCycleScrollView.showPageControl = NO;
    self.jingcaiCycleScrollView.autoScrollTimeInterval = 3;
    self.jingcaiCycleScrollView.backgroundColor = JCClearColor;
    self.jingcaiCycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    [bottomBgView addSubview:self.jingcaiCycleScrollView];
    

    UIButton *hongbaoBtn = [UIButton initWithText:@"立即邀请" FontSize:AUTO(16) Weight:2 BackGroundColor:JCClearColor TextColors:COLOR_713A08];
    [hongbaoBtn setBackgroundImage:JCIMAGE(@"me_invite_btn") forState:0];
    [hongbaoBtn setBackgroundImage:JCIMAGE(@"me_invite_btn") forState:UIControlStateHighlighted];
    [hongbaoBtn hg_setAllCornerWithCornerRadius:24];

    hongbaoBtn.userInteractionEnabled = YES;
    [bottomBgView addSubview:hongbaoBtn];
    [hongbaoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bottomBgView);
        make.top.equalTo(self.jingcaiCycleScrollView.mas_bottom);
        make.width.mas_equalTo(AUTO(270));
        make.height.mas_equalTo(48);
    }];
    
//    UIView *clickv
//    [UIView]
        
        
    //底部榜单
        
        
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.right.offset(AUTO(-12));
        make.top.equalTo(bottomBgView.mas_bottom).offset(10);
        make.height.mas_equalTo(100);
    }];
    
    [self.bottomView addSubview:self.totalLab];
    [self.totalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.left.offset(AUTO(10));
        make.width.mas_equalTo(AUTO(80));
        make.height.mas_equalTo(AUTO(35));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"成功邀请" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.bottomView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.totalLab.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.totalLab);
    }];
    
    [self.bottomView addSubview:self.haveChaiLab];
    [self.haveChaiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.left.equalTo(self.totalLab.mas_right);
        make.width.mas_equalTo(AUTO(80));
        make.height.mas_equalTo(AUTO(35));
    }];
    
    UILabel *label1 = [UILabel initWithTitle:@"固定奖励" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.bottomView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.haveChaiLab.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.haveChaiLab);
    }];
    
    [self.bottomView addSubview:self.noChaiLab];
    [self.noChaiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.left.equalTo(self.haveChaiLab.mas_right);
        make.width.mas_equalTo(AUTO(80));
        make.height.mas_equalTo(AUTO(35));
    }];
    
    UILabel *label2 = [UILabel initWithTitle:@"未拆红包" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.bottomView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.noChaiLab.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.noChaiLab);
    }];
    
//    UIView *chaiView = [UIView new];
//    chaiView.backgroundColor = COLOR_FE4D62;
//    [chaiView hg_setAllCornerWithCornerRadius:AUTO(12.50f)];
//    [self.bottomView addSubview:chaiView];
//    [chaiView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.bottomView.mas_centerY).offset(AUTO(-10));
//        make.right.offset(AUTO(-20));
//        make.size.mas_equalTo(CGSizeMake(AUTO(70), AUTO(25)));
//    }];
    
    UIImageView *imageView = [UIImageView new];
    imageView.userInteractionEnabled = YES;
    imageView.image = JCIMAGE(@"me_invite_redbag");
    [self.bottomView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-5);
        make.top.offset(5);
        make.size.mas_equalTo(CGSizeMake(AUTO(83), AUTO(50)));
    }];
    
    UILabel *chaiLab = [UILabel initWithTitle:@"拆红包" andFont:AUTO(14) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:COLOR_F88727 andTextAlignment:NSTextAlignmentCenter];
    [chaiLab hg_setAllCornerWithCornerRadius:18];
    chaiLab.userInteractionEnabled = YES;
    [self.bottomView addSubview:chaiLab];
    [chaiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageView);
        make.top.equalTo(imageView.mas_bottom).offset(-8);
        make.size.mas_equalTo(CGSizeMake(74, 36));
    }];
    
    
    WeakSelf;
    [hongbaoBtn bk_whenTapped:^{
        if (weakSelf.JCInviteBlock) {
            weakSelf.JCInviteBlock();
        }
    }];
    

    [chaiLab bk_whenTapped:^{
        if (weakSelf.JCChaiBlock) {
            weakSelf.JCChaiBlock();
        }
    }];

    
}



- (void)setModel:(JCYuceShareInfoModel *)model {
    _model = model;
    self.totalLab.text = model.shareCount;
    self.haveChaiLab.text = model.sharegift;
    self.noChaiLab.text = model.cjCount;
}


- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view {
    return [JCInviteFriendCycleCell class];
}


- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view {
    JCInviteFriendCycleCell *myCell = (JCInviteFriendCycleCell *)cell;
    myCell.model = self.titleArray[index];

}



- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    NSMutableArray *array = [NSMutableArray array];
    [titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:@""];
    }];
    self.jingcaiCycleScrollView.imageURLStringsGroup = array;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {

    
}



- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = COLOR_FFF4E5;
        [_bottomView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _bottomView;;
}

- (UILabel *)totalLab {
    if (!_totalLab) {
        _totalLab = [UILabel initWithTitle:@"" andFont:AUTO(32) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _totalLab;
}

- (UILabel *)haveChaiLab {
    if (!_haveChaiLab) {
        _haveChaiLab = [UILabel initWithTitle:@"" andFont:AUTO(32) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _haveChaiLab;
}

- (UILabel *)noChaiLab {
    if (!_noChaiLab) {
        _noChaiLab = [UILabel initWithTitle:@"" andFont:AUTO(32) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _noChaiLab;
}

@end
