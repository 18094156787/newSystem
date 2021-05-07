//
//  JCYCResustShowView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCResustShowView.h"
#import "JCYCResultTableViewCell.h"
#import "JCJingCaiResultMatchModel.h"
@implementation JCYCResustShowView

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
        make.top.offset(AUTO(50)+kNavigationBarHeight);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(420));
    }];
    self.bgView = bgView;
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"yc_resultTipView");
    [self addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView).offset(AUTO(-30));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(91)));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"上次预测结果" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_27272B andBackgroundColor:JCClearColor andTextAlignment:0];
    [bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.offset(AUTO(20));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    UIView *redView = [UIView new];
    redView.backgroundColor = COLOR_FE644D;
    [bgView addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(titleLab.mas_bottom).offset(AUTO(20));
//        make.size.mas_equalTo(CGSizeMake(AUTO(3), AUTO(15)));
        make.size.mas_equalTo(CGSizeMake(0, 0));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(redView.mas_right).offset(AUTO(15));
        make.centerY.equalTo(redView);
    }];
    

    
//    [bgView addSubview:self.resultImgView];
//    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.right.equalTo(bgView);
//        make.width.height.mas_equalTo(AUTO(110));
//    }];
    
    [bgView addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(200));
        make.left.offset(0);
        make.right.offset(0);
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.equalTo(self.tableView.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(15));
    }];
    
    UIButton *sureBtn = [UIButton initWithText:@"立即参与今日预测" FontSize:AUTO(16) BackGroundColor:COLOR_EF2F2F TextColors:JCWhiteColor];
    [bgView addSubview:sureBtn];
    [sureBtn hg_setAllCornerWithCornerRadius:AUTO(26)];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(AUTO(-30));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(250), AUTO(46)));
    }];
    
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"yc_tip_close") forState:0];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_bottom).offset(AUTO(15));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(50)));
    }];
    
    WeakSelf;
    [sureBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
        if (weakSelf.JCSureBlock) {
            weakSelf.JCSureBlock();
        }
    }];
    
    [closeBtn bk_whenTapped:^{
        if (weakSelf.JCCloseBlock) {
            weakSelf.JCCloseBlock();
        }

    }];
    
    [self.tableView registerClass:[JCYCResultTableViewCell class] forCellReuseIdentifier:@"JCYCResultTableViewCell"];
    

}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCYCResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYCResultTableViewCell"];
    cell.tipModel = self.dataArray[indexPath.row];
//    JCParticipateJingCaSuccessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCParticipateJingCaSuccessTableViewCell"];
    cell.selectionStyle = 0;
//    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//     JCJingCaiResultMatchModel *model =self.dataArray[indexPath.row];

    return UITableViewAutomaticDimension;

}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];;
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];;
    }
    return _infoLab;
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
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    
    
   
    [self.tableView reloadData];
}

- (void)setYueceResultModel:(JCYCUserInfoModel *)yueceResultModel {
    _yueceResultModel = yueceResultModel;
    self.dataArray = yueceResultModel.future_info;
//    self.titleLab.text = yueceResultModel.week;
    self.infoLab.text = yueceResultModel.future_msg;
    [self.tableView reloadData];
}

@end
