//
//  JCHongbaoShowView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/2/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbaoShowView.h"
#import "JCHongbaoShowCell.h"
@implementation JCHongbaoShowView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    

    
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(AUTO(300));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"选择红包" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.centerX.equalTo(self.bgView);
        make.height.mas_equalTo(AUTO(40));
    }];
    
    UIButton *closeBtn = [UIButton initWithText:@"取消" FontSize:16 Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_2F2F2F];
    [self.bgView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(AUTO(15));
        make.centerY.equalTo(titleLab);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
//    UIButton *closeBtn = [UIButton new];
//    [closeBtn setImage:JCIMAGE(@"caiyun_close") forState:0];
//    [closeBtn setImage:JCIMAGE(@"caiyun_close") forState:UIControlStateHighlighted];
//    [self.bgView addSubview:closeBtn];
//    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.bgView).offset(AUTO(-10));
//        make.centerY.equalTo(titleLab);
//        make.width.height.mas_equalTo(AUTO(30));
//    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F8F8F8;
    [self.bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(AUTO(9));
        make.left.right.equalTo(self.bgView);
        make.height.mas_equalTo(1);
    }];
    
    
    [self.bgView addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(AUTO(10));
        make.left.right.bottom.equalTo(self.bgView);
    }];
    
    
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        [weakSelf hide];
    }];
    
}


#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (section==0) {
//        return 1;
//    }
//
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCHongbaoShowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbaoShowCell"];
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 58;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataArray enumerateObjectsUsingBlock:^(JCWMyHongbaoBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.is_select = NO;
        
    }];
    JCWMyHongbaoBall *model = self.dataArray[indexPath.row];
    model.is_select = YES;
     if (self.hbPickerSelBlock) {
         self.hbPickerSelBlock(model);
         [self hide];
     }
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];

}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    if (!dataArray) {
        return;
    }
    [self.tableView reloadData];
    
    NSInteger index = 0;
    for (int i=0; i<dataArray.count; i++) {
        JCWMyHongbaoBall *obj = dataArray[i];
        if (obj.is_select) {
            index = i;
            break;;
        }
    }


    
    if (index>0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:NO];
        });
    }
    

}


- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:1];
        view.dataSource = self;
        view.delegate = self;
        //        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        //view.separatorColor = COLOR_SEPRATE;
        view.separatorInset = UIEdgeInsetsMake(0.0f, 15, 0.0f, 0.0f);
        view.separatorColor = COLOR_999999;
        view.showsVerticalScrollIndicator = NO;
        view.separatorStyle = 0;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
        view.tableFooterView = [UIView new];
        //注册cell
        [view registerClass:[JCHongbaoShowCell class] forCellReuseIdentifier:@"JCHongbaoShowCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}



- (void)show {
      self.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
    WeakSelf;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.bgView.transform = CGAffineTransformIdentity;
       
    }];
}

- (void)hide {
      
    WeakSelf;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
         
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf removeFromSuperview];;
    });
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setCornerOnTopWithRadius:AUTO(15)];
    }
    return _bgView;
}

@end
