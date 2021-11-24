//
//  JCTransactionDataModelDetailZhiShuCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelDetailZhiShuCell.h"

@implementation JCTransactionDataModelDetailZhiShuCell

- (void)initViews {
    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(0);
        make.bottom.offset(0);
    }];
    [self.tableView registerClass:[JCTransactionDataModelDetailZhiShuItemCell class] forCellReuseIdentifier:@"JCTransactionDataModelDetailZhiShuItemCell"];
    
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(30));
//    self.tableView.tableHeaderView = self.headView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataArray.count+1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTransactionDataModelDetailZhiShuItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTransactionDataModelDetailZhiShuItemCell"];
    cell.row = indexPath.row;
    
    if (indexPath.row==0) {
        cell.labelOne.backgroundColor = [COLOR_EF2F2F colorWithAlphaComponent:0.08];
        cell.labelTwo.backgroundColor = [COLOR_EF2F2F colorWithAlphaComponent:0.08];
        cell.labelThree.backgroundColor = [COLOR_EF2F2F colorWithAlphaComponent:0.08];
        cell.labelFour.backgroundColor = [COLOR_EF2F2F colorWithAlphaComponent:0.08];
        cell.labelOne.textColor = COLOR_2F2F2F;
        cell.labelTwo.textColor = COLOR_2F2F2F;
        cell.labelThree.textColor = COLOR_2F2F2F;
        cell.labelFour.textColor = COLOR_2F2F2F;
        cell.labelOne.text = @"主胜";
        cell.labelTwo.text = @"平";
        cell.labelThree.text = @"客胜";
        cell.labelFour.text = @"更新时间";
        if ([self.type integerValue]!=1) {
            cell.labelTwo.text = @"指数";
        }



        
    }else{
        JCTransactionDataOddsDetailModel *zhishuModel = self.dataArray[indexPath.row-1];
        cell.labelOne.backgroundColor = JCWhiteColor;
        cell.labelTwo.backgroundColor = JCWhiteColor;
        cell.labelThree.backgroundColor = JCWhiteColor;
        cell.labelFour.backgroundColor = JCWhiteColor;
        
        cell.labelOne.text = [NSString stringWithFormat:@"%@",@([zhishuModel.home_winner floatValue])];
        cell.labelTwo.text =  [NSString stringWithFormat:@"%@",@([zhishuModel.draw floatValue])];
        cell.labelThree.text = [NSString stringWithFormat:@"%@",@([zhishuModel.away_winner floatValue])];
        cell.labelFour.text = [NSString stringWithFormat:@"%@",zhishuModel.update_time];
        
        if (indexPath.row<self.dataArray.count) {
            JCTransactionDataOddsDetailModel *lastModel = self.dataArray[indexPath.row];
            
 
            NSString *homeWin = zhishuModel.home_winner;
            NSString *homeEqual = zhishuModel.draw;
            NSString *homeLose = zhishuModel.away_winner;
                
            NSString *awayWin = lastModel.home_winner;
            NSString *awayEqual = lastModel.draw;
            NSString *awayLose = lastModel.away_winner;
                
                if ([awayWin floatValue]<[homeWin floatValue]) {
                    cell.labelOne.textColor = COLOR_EF2F2F;
                }else if ([awayWin floatValue]==[homeWin floatValue]) {
                    cell.labelOne.textColor = COLOR_2F2F2F;
                }else{
                    cell.labelOne.textColor = COLOR_30B27A;
                }
                
                if ([awayEqual floatValue]<[homeEqual floatValue]) {
                    cell.labelTwo.textColor = COLOR_EF2F2F;
                }else if ([awayEqual floatValue]==[homeEqual floatValue]) {
                    cell.labelTwo.textColor = COLOR_2F2F2F;
                }else{
                    cell.labelTwo.textColor = COLOR_30B27A;
                }

                if ([awayLose floatValue]<[homeLose floatValue]) {
                    cell.labelThree.textColor = COLOR_EF2F2F;
                }else if ([awayLose floatValue]==[homeLose floatValue]) {
                    cell.labelThree.textColor = COLOR_2F2F2F;
                }else{
                    cell.labelThree.textColor = COLOR_30B27A;
                }
                
            
        }
        if ([self.type integerValue]!=1) {
            cell.labelTwo.textColor = COLOR_2F2F2F;
        }

    }

    return cell;
}
#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(30);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}


- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:1];
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
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}



- (void)setDataArray:(NSArray *)dataArray {

    _dataArray = dataArray;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
   
}

@end
