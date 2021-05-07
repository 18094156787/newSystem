//
//  JCTeamDetailHonorShowView1.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailHonorShowView.h"
#import "JCTeamDetailHonorShowHeadView.h"
#import "JCTeamDetailHonorShowViewCell.h"
@implementation JCTeamDetailHonorShowView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:20];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(70));
        make.left.offset(AUTO(38));
        make.right.offset(AUTO(-38));
//        make.height.mas_equalTo(AUTO(232));
        make.height.mas_equalTo(AUTO(330));
    }];
    self.bgView = bgView;
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(bgView);
        make.height.mas_equalTo(AUTO(44));
    }];
    
    UIView *topLineView = [UIView new];
    topLineView.backgroundColor = COLOR_DDDDDD;
    [bgView addSubview:topLineView];
    [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.titleLab);
        make.height.mas_equalTo(0.5);
    }];
    
    

    [bgView addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgView);
        make.top.equalTo(self.titleLab.mas_bottom);
        make.bottom.offset(AUTO(-5));
    }];
 
    [bgView addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.right.offset(0);
        make.height.mas_equalTo(AUTO(44));
        make.width.mas_equalTo(AUTO(60));
    }];
    
//    UIView *bottomLineView = [UIView new];
//    bottomLineView.backgroundColor = COLOR_DDDDDD;
//    [bgView addSubview:bottomLineView];
//    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.equalTo(self.closeBtn);
//        make.height.mas_equalTo(0.5);
//    }];

    
    WeakSelf;
    [self.closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [self.tableView registerClass:[JCTeamDetailHonorShowViewCell class] forCellReuseIdentifier:@"JCTeamDetailHonorShowViewCell"];
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTeamDetailHonorShowViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamDetailHonorShowViewCell"];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}



#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTeamDetailInfoHonorModel *model = self.dataArray[indexPath.row];
    NSInteger height = ceil(model.times.count/3.0f);
    return AUTO(37)+AUTO(17)*height;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
//    if (dataArray.count>=3) {
//        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(AUTO(330));
//        }];
//    }
    [self.tableView reloadData];
}


- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        view.dataSource = self;
        view.delegate = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        view.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCWhiteColor;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        if (@available(iOS 11.0, *)) {
            view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _tableView = view;

        
    }
    
    return _tableView;
}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"球队荣誉" andFont:AUTO(15) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton initWithText:@"" FontSize:AUTO(14) Weight:1 BackGroundColor:JCWhiteColor TextColors:COLOR_999999];
        [_closeBtn setImage:JCIMAGE(@"post_match_close") forState:0];
        [_closeBtn setImage:JCIMAGE(@"post_match_close") forState:0];
    }
    return _closeBtn;
}

@end
