//
//  JCParticipateJingCaSuccessTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/10/16.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCParticipateJingCaSuccessTableViewCell.h"

@implementation JCParticipateJingCaSuccessTableViewCell

- (void)initViews {
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_F8F8F8;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
    
    [bgView addSubview:self.tableView];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(10), AUTO(10), 0, AUTO(10)));
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.bottom.offset(AUTO(-10));
    }];
    
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.model.match.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCParticipateJingCaSuccessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCParticipateJingCaSuccessCell"];
    cell.selectionStyle = 0;
    cell.mathInfoModel = self.model.match[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(90);
}

- (void)setModel:(JCJingCaiResultMatchModel *)model {
    _model = model;
    if (model.hb.length>0) {
    NSString *hongbaoString =[NSString stringWithFormat:@"获得%@元优惠券",model.hb];
        NSMutableAttributedString *hongbaoStringAttrString = [[NSMutableAttributedString alloc] initWithString:hongbaoString];
        NSRange range = [hongbaoString rangeOfString:[NSString stringWithFormat:@"%@元",model.hb]];
        [hongbaoStringAttrString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:AUTO(14)] range:range];
         [hongbaoStringAttrString addAttribute:NSForegroundColorAttributeName value:COLOR_FF3E39 range:range];
        self.infoLab.attributedText = hongbaoStringAttrString;
    }
     
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
        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[JCParticipateJingCaSuccessCell class] forCellReuseIdentifier:@"JCParticipateJingCaSuccessCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

@end
