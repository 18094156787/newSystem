//
//  JCActivityGuessResultShowView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuessResultShowView.h"
#import "JCActivityResultTableViewCell.h"
#import "JCActivityResultWinnerTableViewCell.h"
@implementation JCActivityGuessResultShowView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(30)+kNavigationBarHeight);
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.height.mas_equalTo(AUTO(340));
    }];
    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.mas_equalTo(AUTO(44));
    }];
    
    [self.bgView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.titleLab.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    [self.bgView addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.titleLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(44)));
    }];
    
    [self.bgView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(12));
        make.bottom.offset(AUTO(-12));
    }];
    

    
    [self.tableView registerClass:[JCActivityResultTableViewCell class] forCellReuseIdentifier:@"JCActivityResultTableViewCell"];
    [self.tableView registerClass:[JCActivityResultWinnerTableViewCell class] forCellReuseIdentifier:@"JCActivityResultWinnerTableViewCell"];
    
    WeakSelf;
    [self.closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    return self.dataArray.count;
 
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArray.count==1) {
        JCActivityResultWinnerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityResultWinnerTableViewCell"];
        cell.model = self.dataArray[indexPath.row];
        return cell;
    }
    JCActivityResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityResultTableViewCell"];
    cell.selectionStyle = 0;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return AUTO(8);
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    UIView *backView= [UIView new];
//    return backView;
//}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {    return AUTO(64);
}


- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    
    if (dataArray.count==1) {
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AUTO(50)+kNavigationBarHeight);
            make.left.offset(AUTO(30));
            make.right.offset(AUTO(-30));
            make.height.mas_equalTo(AUTO(236));
        }];
    }else if (dataArray.count<4) {
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AUTO(50)+kNavigationBarHeight);
            make.left.offset(AUTO(30));
            make.right.offset(AUTO(-30));
            make.height.mas_equalTo(AUTO(68)+AUTO(64)*dataArray.count);
        }];
    }

   
    [self.tableView reloadData];
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:20];
    }
    return _bgView;
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"开奖结果" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        [_closeBtn setImage:JCIMAGE(@"post_match_close") forState:0];
        [_closeBtn setImage:JCIMAGE(@"post_match_close") forState:UIControlStateHighlighted];
    }
    return _closeBtn;
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
        view.backgroundColor = JCClearColor;
//        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_F4F4F8;
    }
    return _lineView;
}

@end
