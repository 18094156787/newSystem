//
//  JCUserLoginRedPacketView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCUserLoginRedPacketView.h"
#import "JCUserLoginRedPacketViewCell.h"
#import "JCJingCaiResultMatchModel.h"
@implementation JCUserLoginRedPacketView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
        [self setupUI];
       
    }
    return self;
}
- (void)setupUI {
    UIImageView *bgView = [UIImageView new];
    bgView.image = JCIMAGE(@"ic_redpagert_firstlogin");//
    bgView.userInteractionEnabled = YES;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.offset(kNavigationBarHeight+StatusBar_HEIGHT);
        make.size.mas_equalTo(CGSizeMake(AUTO(315), AUTO(487)));
    }];
    self.bgView = bgView;
    
    UIImageView *imgView = [UIImageView new];
//    imgView.image = JCIMAGE(@"jc_yc_newTitle");
    [bgView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(155));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(171), AUTO(39)));
    }];

    
    [bgView addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgView.mas_bottom).offset(15);
        make.height.mas_equalTo(AUTO(180));
        make.left.offset(12);
        make.right.offset(-12);
    }];
    
    [bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.right.offset(-30);
        make.bottom.offset(-30);
        make.height.mas_equalTo(46);
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
    [closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
        if (weakSelf.JCCloseBlock) {
            weakSelf.JCCloseBlock();
        }
    }];

    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCBlock) {
            weakSelf.JCBlock();
        }
    }];
    
    [self.tableView registerClass:[JCUserLoginRedPacketViewCell class] forCellReuseIdentifier:@"JCUserLoginRedPacketViewCell"];
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    return self.dataArray.count;
 
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCUserLoginRedPacketViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCUserLoginRedPacketViewCell"];
    cell.selectionStyle = 0;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//     JCJingCaiResultMatchModel *model =self.dataArray[indexPath.row];
//    if (model.hb.length>0) {
//        return AUTO(40)+AUTO(90)*model.match.count;
//    }
//    return AUTO(20)+AUTO(90)*model.match.count;
    return AUTO(90);
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"进入我的红包查看" FontSize:16 Weight:2 BackGroundColor:JCWhiteColor TextColors:COLOR_EF2F2F];
        [_sureBtn setBackgroundImage:JCIMAGE(@"ic_yellow_btn_enter") forState:0];
        [_sureBtn setBackgroundImage:JCIMAGE(@"ic_yellow_btn_enter") forState:UIControlStateHighlighted];
        [_sureBtn hg_setAllCornerWithCornerRadius:16];
    }
    return _sureBtn;;
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
    if (self.dataArray.count==1) {
         JCJingCaiResultMatchModel *model =self.dataArray[0];
        if (model.match.count==1) {
            [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.offset(AUTO(50)+kNavigationBarHeight);
                make.left.offset(AUTO(35));
                make.right.offset(AUTO(-35));
                make.height.mas_equalTo(AUTO(250));
            }];
        }

    }

   
    [self.tableView reloadData];
}

@end
