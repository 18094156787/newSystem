//
//  JCMyBuyOrderTjDetailMatchCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyBuyOrderTjDetailMatchCell.h"
#import "JCMyBuyOrderTjDetailMatchInfoCell.h"
#import "JCMyBuyOrderDataCommomCell.h"
@implementation JCMyBuyOrderTjDetailMatchCell

- (void)initViews{
    self.backgroundColor = JCWhiteColor;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:4];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [bgView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    


}

#pragma mark <UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return AUTO(120);
    }
    if (indexPath.row==1) {
    if ([self.detailModel.hongbao_total integerValue]==0) {
        return 0.001f;
        }
    }
    return AUTO(30);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCMyBuyOrderTjDetailMatchInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCMyBuyOrderTjDetailMatchInfoCell"];
        //    cell.matchDic = self.dianPingBall.match_data[indexPath.row];
        if (self.detailModel.match_data.count>0) {
            JCDianPingMatchBall*matchModel = self.detailModel.match_data.firstObject;
            cell.model = matchModel;
            cell.detailModel = self.detailModel;
        }
            return cell;
    }
    JCMyBuyOrderDataCommomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMyBuyOrderDataCommomCell"];//JCBuyOrderDataMonthCell
    cell.titleLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    cell.titleLab.textColor = COLOR_999999;
    cell.contentLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    cell.contentLab.textColor = COLOR_999999;
    if (indexPath.section==1) {

        if (indexPath.row==0) {
            cell.titleLab.text = @"商品总价";
            cell.contentLab.text = [NSString stringWithFormat:@"%ld红币",[self.detailModel.old_total integerValue]/100];
        }
        if (indexPath.row==1) {
            if ([self.detailModel.hongbao_total integerValue]>0) {
                cell.titleLab.text = @"红包抵扣";
                 cell.contentLab.text = [NSString stringWithFormat:@"-%ld红币",[self.detailModel.hongbao_total integerValue]/100];
            }else{
                cell.titleLab.text = @"";
                cell.contentLab.text = @"";
            }
        }
        if (indexPath.row==2) {
            cell.titleLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
            cell.titleLab.text = @"实付";
            cell.titleLab.textColor = COLOR_333333;
            cell.contentLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(17)];
            cell.contentLab.textColor = JCBaseColor;
            NSString *title = [NSString stringWithFormat:@"%ld红币",[self.detailModel.total integerValue]/100];
            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
            NSRange range = [title rangeOfString:@"红币"];
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_030303,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)]} range:range];
            cell.contentLab.attributedText = attr;
        }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCMatchDetailWMStickVC *vc = [JCMatchDetailWMStickVC new];
        if (self.detailModel.match_data.count>0) {
            JCDianPingMatchBall*matchModel = self.detailModel.match_data.firstObject;
            vc.matchNum = matchModel.match_num;
            vc.is_bigData = YES;
            [[self getViewController].navigationController pushViewController:vc animated:YES];
        }

    }
}

- (void)setDetailModel:(JCHongbangOrderDetailModel *)detailModel {
    _detailModel = detailModel;
    [self.tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0.0f, 5, 0.0f, AUTO(10));
        _tableView.separatorColor = COLOR_DDDDDD;
        _tableView.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.backgroundColor = JCWhiteColor;
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 50;
        _tableView.separatorStyle = 0;
        _tableView.scrollEnabled = NO;
        [_tableView registerClass:[JCMyBuyOrderTjDetailMatchInfoCell class] forCellReuseIdentifier:@"JCMyBuyOrderTjDetailMatchInfoCell"];
        [_tableView registerClass:[JCMyBuyOrderDataCommomCell class] forCellReuseIdentifier:@"JCMyBuyOrderDataCommomCell"];
        
//
    }
    
    return _tableView;
}

@end
