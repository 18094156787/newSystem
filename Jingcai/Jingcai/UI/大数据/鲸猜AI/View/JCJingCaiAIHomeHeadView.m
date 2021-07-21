//
//  JCJingCaiAIHomeHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIHomeHeadView.h"
#import "JCAIHomeNoticeCollectionViewCell.h"
#import "JCAIProfitWMPageVC.h"
@implementation JCJingCaiAIHomeHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;

    
    UIView *topBgView = [UIView new];
    [topBgView hg_setAllCornerWithCornerRadius:5];
    topBgView.backgroundColor = JCWhiteColor;
    [self addSubview:topBgView];
    [topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.right.offset(0);
        make.height.mas_equalTo(AUTO(133));
    }];
    
    UILabel *top_titleLab = [UILabel initWithTitle:@"鲸猜AI" andFont:18 andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    [topBgView addSubview:top_titleLab];
    [top_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(0);
    }];

    
    UIImageView *iconImgView = [UIImageView new];
    iconImgView.image = JCIMAGE(@"ic_img_ai");
    [topBgView addSubview:iconImgView];
    [iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.top.offset(8);
        make.size.mas_equalTo(CGSizeMake(AUTO(184), AUTO(109)));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [topBgView addSubview:titleLab];
    titleLab.numberOfLines = 0;
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
       make.top.equalTo(top_titleLab.mas_bottom).offset(4);
       make.right.equalTo(iconImgView.mas_left).offset(25);
    }];
    titleLab.text = @"鲸猜AI运用大数据算法，通过对比赛球队的各项数据、关键指标进行多维度、智能分析，预测得出各种玩法的结果！";
    
    
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
//        make.bottom.offset(AUTO(-7));
        make.top.equalTo(topBgView.mas_bottom).offset(0);
        make.height.mas_equalTo(AUTO(44));
    }];
    
    self.noticeCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(AUTO(15), 0, SCREEN_WIDTH-AUTO(15), AUTO(36)) imageNamesGroup:nil];
    self.noticeCycleScrollView.delegate = self;
//    self.noticeCycleScrollView.clipsToBounds = YES;
    self.noticeCycleScrollView.showPageControl = NO;
    self.noticeCycleScrollView.autoScrollTimeInterval = 3;
    self.noticeCycleScrollView.backgroundColor = JCClearColor;
    self.noticeCycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    [self.bottomView addSubview:self.noticeCycleScrollView];

    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(185), 0, AUTO(8), 0));
    }];
    
    
    
    self.bgView = bgView;
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = JCBaseColor;
    [bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(4);
        make.centerY.equalTo(lineView);
        make.height.mas_equalTo(AUTO(25));
    }];
    
    [bgView addSubview:self.rqView];
    [self.rqView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgView);
        make.top.equalTo(self.titleLab.mas_bottom);
        make.height.mas_equalTo(AUTO(85));
    }];
    
    UIView *line = [UIView new];
    line.backgroundColor = [COLOR_000000 colorWithAlphaComponent:0.06];
    [bgView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.rqView.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(1);
    }];
    self.line = line;
    
    [bgView addSubview:self.jqsView];
    [self.jqsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgView);
        make.top.equalTo(line.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(85));
    }];
    




    WeakSelf;
    [self.rqView bk_whenTapped:^{
        JCAIProfitWMPageVC *vc = [JCAIProfitWMPageVC new];
        vc.rqArray = weakSelf.rqArray;
        vc.jqsArray = weakSelf.jqsArray;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    
    [self.jqsView bk_whenTapped:^{
        JCAIProfitWMPageVC *vc = [JCAIProfitWMPageVC new];
        
        vc.rqArray = weakSelf.rqArray;
        vc.jqsArray = weakSelf.jqsArray;
        if (weakSelf.rqArray.count>0) {
            vc.selectIndex = 1;
        }
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
}


- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view {
    return [JCAIHomeNoticeCollectionViewCell class];
}


- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view {
    JCAIHomeNoticeCollectionViewCell *myCell = (JCAIHomeNoticeCollectionViewCell *)cell;
    myCell.model = self.titleArray[index];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    JCJingCaiAINoticeModel *model = self.titleArray[index];
    JCMatchDetailWMStickVC *vc = [JCMatchDetailWMStickVC new];
    if (model.match_id) {
        vc.matchNum = model.match_id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }

    
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    NSMutableArray *array = [NSMutableArray array];
    [titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:@""];
    }];
    self.noticeCycleScrollView.imageURLStringsGroup = array;

    if (array.count==0) {
    
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(AUTO(141), 0, 8, 0));
        }];

    }
    self.bottomView.hidden = titleArray.count==0?YES:NO;
    
    
}

- (void)data {
    self.rqView.iconImgView.image = JCIMAGE(@"ic_yqzs_rq");
    self.rqView.titleLab.text = @"让球";
    self.jqsView.iconImgView.image = JCIMAGE(@"ic_yqzs_jqs");
    self.jqsView.titleLab.text = @"进球数";
}

- (void)setRqArray:(NSArray *)rqArray {
    _rqArray = rqArray;
    self.rqView.dataArray = rqArray;
    self.rqView.hidden = rqArray.count==0?YES:NO;
    self.line.hidden = rqArray.count==0?YES:NO;
    if (rqArray.count==0) {
        [self.rqView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];

    }else{
        [self.rqView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(85));
        }];
    }
    
}

- (void)setJqsArray:(NSArray *)jqsArray{
    _jqsArray = jqsArray;
    self.jqsView.hidden = jqsArray.count>0?NO:YES;
    self.jqsView.dataArray = jqsArray;
    if (self.rqArray.count==0&&self.jqsArray.count==0) {
        self.bgView.hidden = YES;
    }else{
        self.bgView.hidden = NO;
    }
    self.line.hidden = jqsArray.count==0?YES:NO;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"盈利指数" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (JCJingCaiAIHomeZhiShuTypeView *)rqView {
    if (!_rqView) {
        _rqView = [JCJingCaiAIHomeZhiShuTypeView new];
        _rqView.hidden = YES;
    }
    return _rqView;
}

- (JCJingCaiAIHomeZhiShuTypeView *)jqsView {
    if (!_jqsView) {
        _jqsView = [JCJingCaiAIHomeZhiShuTypeView new];
        _jqsView.hidden = YES;
    }
    return _jqsView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = JCWhiteColor;
    }
    return _bottomView;
}

@end
