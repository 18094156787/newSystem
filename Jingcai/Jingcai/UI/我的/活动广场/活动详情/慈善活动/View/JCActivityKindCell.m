//
//  JCActivityKindCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityKindCell.h"

@implementation JCActivityKindCell


- (void)initViews {
    self.backgroundColor = JCClearColor;
    self.contentView.backgroundColor = JCClearColor;
    self.titleArr = @[@"活动完成用户",@"积分明细",@"我的奖励"];
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:12];
    bgView.backgroundColor = UIColorFromRGB(0xFFFDFA);
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(20, 16, 0, 16));
    }];
    
    self.categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-32, 44)];
    self.categoryView.titles = self.titleArr;
    self.categoryView.titleSelectedColor = COLOR_FB5835;
    self.categoryView.titleColor = UIColorFromRGB(0x7A7372);
    
    self.categoryView.titleFont = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    self.categoryView.titleSelectedFont = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    self.categoryView.titleLabelZoomScrollGradientEnabled = NO;
    self.categoryView.delegate = self;
    //self.categoryView.titleColorGradientEnabled = YES;
    [bgView addSubview:self.categoryView];
    
    [self.contentView addSubview:self.getScoreImgView];
    [self.getScoreImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(7);
        make.left.equalTo(bgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(54, 22));
        
    }];

    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorWidth = JXCategoryViewAutomaticDimension;
    lineView.lineStyle = JXCategoryIndicatorLineStyle_Lengthen;
    lineView.verticalMargin = 2;
    lineView.indicatorWidth = 36;
    lineView.indicatorColor = COLOR_FB5835;
    self.categoryView.indicators = @[lineView];

    self.listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    self.listContainerView.frame = CGRectMake(0, 44, SCREEN_WIDTH-32, 380);//390
//    self.listContainerView.scrollView.contentSize =  CGSizeMake(SCREEN_WIDTH-32, 1000);
    self.listContainerView.scrollView.scrollEnabled = NO;
//    self.listContainerView.scrollView.bounces = NO;
    [bgView addSubview:self.listContainerView];
    //关联到categoryView
    self.categoryView.listContainer = self.listContainerView;
//    self.listContainerView.scrollView = NO;

    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(aaaa)];
//    pan.delegate = self;
//    [self.listContainerView addGestureRecognizer:pan];

}

//4、代理JXCategoryViewDelegate

-(void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
//侧滑手势处理
[self getViewController].navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
NSLog(@"%@", NSStringFromSelector(_cmd));
}
//点击选中
- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index {
//    if (index==0) {
//        if (self.JCHeightBlock) {
//            self.JCHeightBlock(self.userVC.contentHeight);
//        }
//    }
    if (index==1) {
        self.getScoreImgView.hidden = YES;
    }
//    if (index==2) {
//        if (self.JCHeightBlock) {
//            self.JCHeightBlock(self.prizeVC.contentHeight);
//        }
//    }
}
//滚动
-(void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
//    if (index==0) {
//        if (self.JCHeightBlock) {
//            self.JCHeightBlock(self.userVC.contentHeight);
//        }
//    }
//    if (index==1) {
//        if (self.JCHeightBlock) {
//            self.JCHeightBlock(self.scoreVC.contentHeight);
//        }
//    }
//    if (index==2) {
//        if (self.JCHeightBlock) {
//            self.JCHeightBlock(self.prizeVC.contentHeight);
//        }
//    }
}

//5、代理JXCategoryListContainerViewDelegate

-(id)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    WeakSelf;
    if (index == 0) {

        self.userVC.actID = self.actID;
//        self.userVC.JCHeightBlock = ^(float heihgt) {
//            weakSelf.listContainerView.frame = CGRectMake(0, 44, SCREEN_WIDTH, heihgt);
//            if (weakSelf.JCHeightBlock) {
//                weakSelf.JCHeightBlock(heihgt);
//            }
//        };
        return self.userVC;
    }
    if (index == 1) {

        self.scoreVC.actID = self.actID;
//        self.scoreVC.JCHeightBlock = ^(float heihgt) {
//            weakSelf.listContainerView.frame = CGRectMake(0, 44, SCREEN_WIDTH, heihgt);
//            if (weakSelf.JCHeightBlock) {
//                weakSelf.JCHeightBlock(heihgt);
//            }
//        };
        return self.scoreVC;

    }
    self.prizeVC.actID = self.actID;
//    self.prizeVC.JCHeightBlock = ^(float heihgt) {
//        weakSelf.listContainerView.frame = CGRectMake(0, 44, SCREEN_WIDTH, heihgt);
//        if (weakSelf.JCHeightBlock) {
//            weakSelf.JCHeightBlock(heihgt);
//        }
//    };
    return self.prizeVC;

}

-(NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titleArr.count;
}

- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    _detailModel = detailModel;
    if (!detailModel) {
        return;
    }
    self.userVC.detailModel = detailModel;
    self.scoreVC.detailModel = detailModel;
    self.prizeVC.detailModel = detailModel;
    self.getScoreImgView.hidden = [detailModel.is_new integerValue]==1?NO:YES;

//    self.listContainerView.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH-50, 500);
}

- (UIImageView *)getScoreImgView {
    if (!_getScoreImgView) {
        _getScoreImgView = [UIImageView new];
        _getScoreImgView.image = JCIMAGE(@"ic_kind_new");
    }
    return _getScoreImgView;
}

- (JCActivityKindUserVC *)userVC {
    if (!_userVC) {
        _userVC = [JCActivityKindUserVC new];
    }
    return _userVC;
}

- (JCActivityKindScoreVC *)scoreVC {
    if (!_scoreVC) {
        _scoreVC = [JCActivityKindScoreVC new];
    }
    return _scoreVC;
}

- (JCActivityKindMyPrizeVC *)prizeVC {
    if (!_prizeVC) {
        _prizeVC = [JCActivityKindMyPrizeVC new];
    }
    return _prizeVC;
}

@end
