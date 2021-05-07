//
//  JCYCHomeHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCHomeHeadView.h"
#import "JCYCHomeRewardCycleCell.h"
#import "JCYCMyYcWMStickyVC.h"
#import "JCYCRankStickyVC.h"
#import "JCYCMyFriendViewController.h"
@implementation JCYCHomeHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F0F0F0;
  
    self.cycleBgView = [UIImageView new];
    self.cycleBgView.image = JCIMAGE(@"yuce_topBgView");
    self.cycleBgView.frame = CGRectMake(AUTO(12), 10, SCREEN_WIDTH-AUTO(24),72);
    self.cycleBgView.userInteractionEnabled = YES;
    [self.cycleBgView hg_setAllCornerWithCornerRadius:36.0f];
    [self addSubview:self.cycleBgView];

    
    self.jingcaiCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(AUTO(60), 20, 200, 40) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.jingcaiCycleScrollView.clipsToBounds = YES;
    self.jingcaiCycleScrollView.showPageControl = NO;
    self.jingcaiCycleScrollView.autoScrollTimeInterval = 3;
    self.jingcaiCycleScrollView.backgroundColor = JCClearColor;
    self.jingcaiCycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    [self.cycleBgView addSubview:self.jingcaiCycleScrollView];
    
    UILabel *hongbaoLab = [UILabel initWithTitle:@"抢红包" andFont:0 andWeight:0 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    hongbaoLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    [self.cycleBgView addSubview:hongbaoLab];
    [hongbaoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.jingcaiCycleScrollView);
        make.right.offset(-60);
    }];
    
    
//底部榜单
    
    
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.right.offset(AUTO(-12));
        make.top.equalTo(self.cycleBgView.mas_bottom).offset(5);
        make.height.mas_equalTo(90);
    }];
    
    
    UIImageView *clubImgView = [UIImageView new];
    clubImgView.image = JCIMAGE(@"yuce_club");
    clubImgView.userInteractionEnabled = YES;
    [self.bottomView addSubview:clubImgView];
    [clubImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(5);
        make.centerX.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(39, 50));
    }];
    
    UILabel *clubLab = [UILabel initWithTitle:@"十连红俱乐部" andFont:14 andWeight:0 andTextColor:COLOR_27272B andBackgroundColor:JCClearColor andTextAlignment:0];
    clubLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    [self.bottomView addSubview:clubLab];
    [clubLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(clubImgView);
        make.top.equalTo(clubImgView.mas_bottom).offset(5);
    }];
    
    UIImageView *weekImgView = [UIImageView new];
    weekImgView.image = JCIMAGE(@"yuce_rank");
    weekImgView.userInteractionEnabled = YES;
    [self.bottomView addSubview:weekImgView];
    [weekImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(clubImgView);
        make.left.offset(AUTO(40));
        make.size.mas_equalTo(CGSizeMake(36, 36));
    }];
    
    UILabel *weekLab = [UILabel initWithTitle:@"本周榜单" andFont:14 andWeight:0 andTextColor:COLOR_27272B andBackgroundColor:JCClearColor andTextAlignment:0];
    weekLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    [self.bottomView addSubview:weekLab];
    [weekLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weekImgView);
        make.top.equalTo(clubImgView.mas_bottom).offset(5);
    }];
    
    UIImageView *myYCImgView = [UIImageView new];
    myYCImgView.image = JCIMAGE(@"yuce_myyuce");
    myYCImgView.userInteractionEnabled = YES;
    [self.bottomView addSubview:myYCImgView];
    [myYCImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(clubImgView);
        make.right.offset(AUTO(-40));
        make.size.mas_equalTo(CGSizeMake(36, 36));
    }];
    
    UILabel *myYCLab = [UILabel initWithTitle:@"我的预测" andFont:14 andWeight:0 andTextColor:COLOR_27272B andBackgroundColor:JCClearColor andTextAlignment:0];
    myYCLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    [self.bottomView addSubview:myYCLab];
    [myYCLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(myYCImgView);
        make.top.equalTo(myYCImgView.mas_bottom).offset(5);
    }];
    
    WeakSelf;
    
    
    [weekImgView bk_whenTapped:^{
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return;
        }
        JCYCRankStickyVC *vc = [JCYCRankStickyVC new];
        vc.selectIndex =1;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    
    [clubImgView bk_whenTapped:^{
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return;
        }
        JCYCRankStickyVC *vc = [JCYCRankStickyVC new];
        
        vc.selectIndex =2;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    
    [myYCImgView bk_whenTapped:^{
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return;
        }
        [[weakSelf getViewController].navigationController pushViewController:[JCYCMyYcWMStickyVC new] animated:YES];
    }];
    
    
    [self.cycleBgView bk_whenTapped:^{
        if (![JCWUserBall currentUser]) {
            [weakSelf presentLogin];
            return;
        }
        [[weakSelf getViewController].navigationController pushViewController:[JCYCMyFriendViewController new] animated:YES];
    }];
    
}



- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view {

    return [JCYCHomeRewardCycleCell class];
}


- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view {
    if (view==self.jingcaiCycleScrollView) {
        JCYCHomeRewardCycleCell *myCell = (JCYCHomeRewardCycleCell *)cell;
        myCell.model = self.titleArray[index];
    }

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
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"开始拖拽");
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        [_bgView hg_setCornerOnBottomWithRadius:100];
    }
    return _bgView;;
}

- (UIView *)contentBgView {
    if (!_contentBgView) {
        _contentBgView = [UIView new];
    }
    return _contentBgView;;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = JCWhiteColor;
        [_bottomView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _bottomView;;
}

@end
