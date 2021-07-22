//
//  JCActivityGuess_SPF_More_CheckView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/22.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuess_SPF_More_CheckView.h"
#import "JCActivityGuess_SPF_More_CheckCell.h"
@implementation JCActivityGuess_SPF_More_CheckView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:16];
    bgView.backgroundColor = JCWhiteColor;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(70)*4+AUTO(135)+AUTO(45));
    }];
    self.bgView = bgView;
    
    UILabel *titleLab = [UILabel initWithTitle:@"提交选项确认" andFont:16 andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.centerX.equalTo(bgView);
        make.height.mas_equalTo(20);
    }];
    self.titleLab = titleLab;
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [COLOR_000000 colorWithAlphaComponent:0.06];
    [bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(titleLab.mas_bottom).offset(20);
        make.height.mas_equalTo(1);
    }];
    self.lineView = lineView;
//
    [bgView addSubview:self.tableView];
    self.tableView.backgroundColor = JCWhiteColor;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(0);
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(70)*4+AUTO(45));
        make.left.offset(0);
        make.right.offset(0);

    }];
    
    float width = (SCREEN_WIDTH-AUTO(100))/2.0f;
    
    [bgView addSubview:self.cancelBtn];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_centerX).offset(-4);
        make.bottom.offset(-AUTO(15));
        make.size.mas_equalTo(CGSizeMake(width, 44));
    }];
    
    [bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).offset(4);
        make.bottom.offset(-AUTO(15));
        make.size.mas_equalTo(CGSizeMake(width, 44));
    }];
    
    WeakSelf;
    [self.cancelBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCSureBlock) {
            weakSelf.JCSureBlock();
        }
    }];

    
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    return self.dataArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(62);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCActivityGuess_SPF_More_CheckCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityGuess_SPF_More_CheckCell"];
    cell.selectionStyle = 0;
//    cell.pp_Model = self.dataArray[indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(8);
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    if (dataArray.count<5) {
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(70)*dataArray.count+AUTO(15));
        }];
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {

            make.height.mas_equalTo(AUTO(70)*dataArray.count+AUTO(140));
        }];
    }

//    if (dataArray.count<=5) {
//        NSInteger count = ceil(self.dataArray.count/2.0f);
//        [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(AUTO(70)*count);
//        }];
//
//        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
//
//            make.height.mas_equalTo(62*count+170);
//        }];
//    }else{
//        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.lineView.mas_bottom).offset(15);
//            make.centerX.equalTo(self);
//            make.height.mas_equalTo(278);
//            make.left.offset(0);
//            make.right.offset(0);
//
//        }];
//
//        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(450);
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
        view.backgroundColor = JCClearColor;
//        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[JCActivityGuess_SPF_More_CheckCell class] forCellReuseIdentifier:@"JCActivityGuess_SPF_More_CheckCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}
- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton initWithText:@"我再想想" FontSize:16 BackGroundColor:JCClearColor TextColors:JCBaseColor];
        _cancelBtn.layer.borderColor = JCBaseColor.CGColor;
        _cancelBtn.layer.borderWidth = 1;
        _cancelBtn.layer.cornerRadius = 22;
        _cancelBtn.layer.masksToBounds = YES;
    }
    return _cancelBtn;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"确认提交" FontSize:16 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        _sureBtn.layer.borderColor = JCBaseColor.CGColor;
        _sureBtn.layer.borderWidth = 1;
        _sureBtn.layer.cornerRadius = 22;
        _sureBtn.layer.masksToBounds = YES;
    }
    return _sureBtn;
}
@end
