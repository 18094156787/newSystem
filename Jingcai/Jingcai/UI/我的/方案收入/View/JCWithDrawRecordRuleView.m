//
//  JCWithDrawRecordRuleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWithDrawRecordRuleView.h"
#import "JCGaoChouRuleCell.h"
#import "JCPostCheckRuleTitleView.h"
#import "JCWithDrawRecordRuleTitleView.h"
@implementation JCWithDrawRecordRuleView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(20)];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(35));
        make.right.offset(AUTO(-35));
        make.top.offset(kNavigationBarHeight+AUTO(20));
        make.bottom.offset(AUTO(-80));
    }];
    [bgView addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(bgView);
        make.bottom.offset(AUTO(-75));
    }];
    
//    JCWithDrawRecordRuleTitleView *headView = [JCWithDrawRecordRuleTitleView new];
//    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH-AUTO(70), AUTO(60));
//    self.tableView.tableHeaderView = headView;
    
    [bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.bottom.offset(AUTO(-20));
        make.size.mas_equalTo(CGSizeMake(AUTO(270), AUTO(44)));
        
    }];
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.contentArray.count;
    
}

- (JCGaoChouRuleCell *)extracted:(UITableView * _Nonnull)tableView {
    JCGaoChouRuleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCGaoChouRuleCell"];
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCGaoChouRuleCell * cell = [self extracted:tableView];
    cell.selectionStyle = 0;
    cell.titleLab.text = self.contentArray[indexPath.row];
    return cell;
}
#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    JCPostCheckRuleTitleView *headView = [JCPostCheckRuleTitleView new];
//    headView.titleLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
//    headView.titleLab.textColor = COLOR_2F2F2F;
//    headView.titleLab.text = self.titleArray[section];
////    if (section==0) {
////        headView.titleLab.textAlignment = NSTextAlignmentCenter;
////    }else{
////        headView.titleLab.textAlignment = 0;
////    }
//    return headView;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    NSString *text = self.titleArray[section];
//    CGSize size = [self returnTextWidth:text size:CGSizeMake(SCREEN_WIDTH-AUTO(100), 1000) font:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]];
//    return size.height+15;
//}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)sureBtnClick {
    [self removeFromSuperview];
}

- (CGSize)returnTextWidth:(NSString *)text size:(CGSize)size font:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return textSize;
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:1];
        view.dataSource = self;
        view.delegate = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        //view.separatorColor = COLOR_SEPRATE;
        view.separatorInset = UIEdgeInsetsMake(0.0f, 15, 0.0f, 0.0f);
        view.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        view.estimatedRowHeight = 50;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
        view.tableFooterView = [UIView new];
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [view registerClass:[JCGaoChouRuleCell class] forCellReuseIdentifier:@"JCGaoChouRuleCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"1、通过发布文章而获得的红币作为稿酬；",@"2、专家号的作者按照对应的收益比例获得稿酬；用户通过iOS端付费查看的，作者将获得35%；通过安卓端付费查看的，作者将获得40%；",@"3、依据国家法律，每笔稿酬的提取需要交纳所得税，计算方法如下：",@"4、每月10号前确认上月稿酬，平台将在每月10号通过转账方式支付至专家号用户指定银行账户。（鲸猜足球平台委托厦门精彩长红网络科技有限公司代发稿酬。）"];
    }
    return _titleArray;
}

- (NSArray *)contentArray {
    if (!_contentArray) {
        _contentArray = @[@"收入计算方式",@"1、通过发布文章而获得的红币作为稿酬；",@"2、作者按照对应的收益比例获得稿酬；用户通过iOS端付费查看的，作者将获得35%；通过安卓端付费查看的，作者将获得40%；",@"3、依据国家法律，每笔稿酬的提取需要交纳所得税，计算方法如下：",@"1）提现不足800元，不纳税；",@"2）稿酬所得不足4000时，所得税=（稿酬所得-800）x 20% x（1-30%）",@"3）超过4000时, 所得税=稿酬所得 x （1-20%）x 20% x （1-30%）",@"4、每月10号前确认上月稿酬，平台将在每月10号通过转账方式支付至专家号用户指定银行账户。（鲸猜足球平台委托厦门精彩长红网络科技有限公司代发稿酬。）"];
    }
    return _contentArray;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"知道了" FontSize:AUTO(14) Weight:1 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
//        [_sureBtn setBackgroundImage:JCIMAGE(@"button_bg") forState:0];
//        [_sureBtn setBackgroundImage:JCIMAGE(@"button_bg") forState:UIControlStateHighlighted];
        [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
    }
    return _sureBtn;
}

@end
