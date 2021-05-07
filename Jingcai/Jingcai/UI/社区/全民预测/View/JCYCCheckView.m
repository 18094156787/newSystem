//
//  JCYCCheckView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCCheckView.h"
#import "JCYCCheckTableViewCell.h"
#import "JCJingCaiResultMatchModel.h"
@implementation JCYCCheckView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
        [self setupUI];
       
    }
    return self;
}
- (void)setupUI {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(10)];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(100)+kNavigationBarHeight);
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.height.mas_equalTo(AUTO(300));
    }];
    self.bgView = bgView;

    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(30));
        make.height.mas_equalTo(AUTO(20));
        make.centerX.equalTo(bgView);
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(15));
        make.centerX.equalTo(bgView);
    }];


    [bgView addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(100));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    UIButton *cancelBtn = [UIButton initWithText:@"我再想想" FontSize:AUTO(12) BackGroundColor:COLOR_F0F0F0 TextColors:COLOR_2F2F2F];
    [bgView addSubview:cancelBtn];
    cancelBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    [cancelBtn hg_setAllCornerWithCornerRadius:AUTO(26)];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom).offset(AUTO(20));
        make.right.equalTo(self.mas_centerX).offset(-2);
        make.size.mas_equalTo(CGSizeMake(AUTO(136), AUTO(46)));
    }];
    
    UIButton *sureBtn = [UIButton initWithText:@"确认提交" FontSize:AUTO(12) BackGroundColor:COLOR_EF2F2F TextColors:JCWhiteColor];
    [bgView addSubview:sureBtn];
    sureBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    [sureBtn hg_setAllCornerWithCornerRadius:AUTO(26)];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom).offset(AUTO(20));
        make.left.equalTo(self.mas_centerX).offset(2);
        make.size.mas_equalTo(CGSizeMake(AUTO(136), AUTO(46)));
    }];
    self.sureBtn = sureBtn;
    
    WeakSelf;
    [cancelBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [self.tableView registerClass:[JCYCCheckTableViewCell class] forCellReuseIdentifier:@"JCYCCheckTableViewCell"];
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCYCCheckTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYCCheckTableViewCell"];
    cell.selectionStyle = 0;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;

}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"参与预测确认" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_27272B andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel labelTitle:@"您即将要预测的单场赛果如下" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    }
    return _infoLab ;
}

- (UIImageView *)resultImgView {
    if (!_resultImgView) {
        _resultImgView = [UIImageView new];
        _resultImgView.image = JCIMAGE(@"zs_zj");
    }
    return _resultImgView;
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
        view.backgroundColor = COLOR_FCFCFC;
//        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        view.layer.borderWidth = 1;
        view.layer.borderColor = COLOR_F2F2F2.CGColor;
        _tableView = view;

        
    }
    
    return _tableView;
}
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;


   
    [self.tableView reloadData];
}

@end
