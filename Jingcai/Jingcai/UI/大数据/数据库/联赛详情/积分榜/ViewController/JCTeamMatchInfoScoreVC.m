//
//  JCTeamMatchInfoScoreVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoScoreVC.h"
#import "JCDataBaseTitleHeadView.h"
#import "JCTeamMatchInfoScoreLianSaiCell.h"
#import "JCTeamMatchInfoScoreRuleCell.h"
#import "JCTeamMatchInfoScoreXioaZuCell.h"
#import "JCEventScoreLianSaiSelModel.h"
#import "JCEventScoreXiaoZuSelModel.h"
#import "JCTeamMatchInfoTimeChooseView.h"
#import "ZJPickerView.h"
#import "JCEventStageModel.h"
@interface JCTeamMatchInfoScoreVC ()

@property (nonatomic,assign) NSInteger type;//1-联赛、2-杯赛、3-友谊赛

@property (nonatomic,strong) NSString *rule;

@property (nonatomic,strong) NSMutableArray *dataSourceArray;

@property (nonatomic,strong) NSMutableArray *timeArray;

@property (nonatomic,strong) NSMutableArray *timeTitleArray;

@property (nonatomic,strong) NSString *promotion_name;

@property (nonatomic,strong) NSString *currentGroupName;

@end

@implementation JCTeamMatchInfoScoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self getStage_list];
//    [self refreshData];
    [ZJPickerView clear];
}

- (void)refreshData {
    [self.fatherView showLoading];
    if ([self.stage_id integerValue]==0||[self.season_id intValue]==0) {
        //如果是0则不请求,否则会报错
        return;
    }
    
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseScoreRankWithType:@"2" competiton_id:self.event_id Season_id:self.season_id stage_id:NonNil(self.stage_id) Success:^(id  _Nullable object) {
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            [self.dataArray removeAllObjects];
            self.type = [object[@"data"][@"comp_type"] integerValue];
            self.rule = object[@"data"][@"rule"];
            if (self.type==1) {
                NSArray *array0 = object[@"data"][@"list"];

                if (array0.count>0) {
                    if (array0.count==1) {
                        NSArray *array = array0.firstObject;
                        NSArray *dataArray = [JCWJsonTool arrayWithJson:array class:[JCEventScoreLianSaiInfoModel class]];
    //                    self.dataArray = [NSMutableArray arrayWithArray:dataArray];
                        [dataArray enumerateObjectsUsingBlock:^(JCEventScoreLianSaiInfoModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                            if ([obj.promotion.name_zh isEqualToString:self.promotion_name]) {
                                obj.promotion.name_zh = @"";
                            }else{
                                self.promotion_name = obj.promotion.name_zh;
                            }
                        }];
                        [self.dataArray addObject:dataArray];

                    }else {
                        
                        for (int i=0; i<array0.count; i++) {
                            NSArray *array1 = array0[i];
                            NSArray *array  = [JCWJsonTool arrayWithJson:array1 class:[JCEventScoreLianSaiInfoModel class]];
                            [array enumerateObjectsUsingBlock:^(JCEventScoreLianSaiInfoModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                if ([obj.promotion.name_zh isEqualToString:self.promotion_name]) {
                                    obj.promotion.name_zh = @"";
                                }else{
                                    self.promotion_name = obj.promotion.name_zh;
                                }
                            }];
                            [self.dataArray addObject:array];
                        }
                        
                        

                    }

                }

            }
            if (self.type==2||self.type==3) {
//                self.dataSourceArray = [NSMutableArray array];
                NSArray *dataArray = object[@"data"][@"list"];
                for (int i=0; i<dataArray.count; i++) {
                    NSArray *array0 = dataArray[i];
                    NSArray *array  = [JCWJsonTool arrayWithJson:array0 class:[JCEventScoreLianSaiInfoModel class]];

                    [self.dataArray addObject:array];
                }

            }
//            if (self.dataArray.count==0) {
//                UIView *headView = [UIView new];
//                headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
//                self.tableView.tableHeaderView = headView;
//                [headView showNoData];
//            }else {
//                self.tableView.tableHeaderView = nil;
//            }

            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];

}
//获取阶段列表
- (void)getStage_list {
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseStage_listWithSeason_id:NonNil(self.season_id) Success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCEventStageModel class]];
//            NSMutableArray *dataArray = [NSMutableArray array];
            [array enumerateObjectsUsingBlock:^(JCEventStageModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj.group_count integerValue]>0||[obj.round_count integerValue]>0) {
                    [self.timeArray addObject:obj];
                }
                
            }];
            if (self.timeArray.count>0) {
                [self.timeArray enumerateObjectsUsingBlock:^(JCEventStageModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [self.timeTitleArray addObject:obj.name_zh];
                    if (idx==0) {
                        self.currentGroupName = obj.name_zh;
                    }
                    
                }];
            }
            if (self.timeArray.count>0) {
                JCEventStageModel *stageModel = self.timeArray.firstObject;
                self.stage_id = stageModel.id;
//                self.tableView.tableHeaderView = nil;
                [self refreshData];
            }else {
//                UIView *headView = [UIView new];
//                headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
//                self.tableView.tableHeaderView = headView;
//                [headView showNoData];
            }
            
            
            

//            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];

}


- (void)initViews {
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCTeamMatchInfoScoreLianSaiCell class] forCellReuseIdentifier:@"JCTeamMatchInfoScoreLianSaiCell"];
    [self.tableView registerClass:[JCTeamMatchInfoScoreRuleCell class] forCellReuseIdentifier:@"JCTeamMatchInfoScoreRuleCell"];
    [self.tableView registerClass:[JCTeamMatchInfoScoreXioaZuCell class] forCellReuseIdentifier:@"JCTeamMatchInfoScoreXioaZuCell"];
    

}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.dataArray.count==0) {
        return 2;
    }
    return self.dataArray.count+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dataArray.count>0) {
        if (section==self.dataArray.count) {
            return 1;
        }
        if (self.type==1) {
            if (self.dataArray.count>0) {
                return 1;
            }

        }
        
        if (self.type==2||self.type==3) {
            if (self.dataArray.count>0) {
                return 1;
            }

        }
        return 0;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArray.count>0) {
        if (indexPath.section==self.dataArray.count) {
            JCTeamMatchInfoScoreRuleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoScoreRuleCell"];
            cell.rule = self.rule;
            return cell;
        }
        if (self.type==1) {
            JCTeamMatchInfoScoreLianSaiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoScoreLianSaiCell"];
            NSArray *array = self.dataArray[indexPath.section];
            cell.dataArray = array;
            cell.showTop= self.dataArray.count>1?YES:NO;
            return cell;
        }
        if (self.type==2||self.type==3) {
            JCTeamMatchInfoScoreXioaZuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoScoreXioaZuCell"];
            NSArray *array =  self.dataArray[indexPath.section];
            cell.dataArray = array;
            return cell;
        }
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        return cell;
    }
    if (indexPath.section==1) {
        JCTeamMatchInfoScoreRuleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoScoreRuleCell"];
        cell.rule = self.rule;
        return cell;
    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (indexPath.section==0) {
        [cell.contentView  showNoData];
//        UIView *headView = [UIView new];
//        headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
//        self.tableView.tableHeaderView = headView;
//        [headView showNoData];

    }
    return cell;


}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArray.count>0) {
        if (indexPath.section==self.dataArray.count) {
            return UITableViewAutomaticDimension;
        }
        if (self.type==1) {
            NSArray *array = self.dataArray[indexPath.section];
            return AUTO(32)+AUTO(35)*array.count+AUTO(10)+AUTO(8);//64是头部高度,10是区尾
        }
        if (self.type==2||self.type==3) {
            NSArray *array = self.dataArray[indexPath.section];
    //        JCEventScoreXiaoZuInfoModel *aModel  = model.team[indexPath.row];
            return AUTO(64)+AUTO(35)*array.count+AUTO(10);//64是头部高度,10是区尾
        }
        return 0.001f;
    }
    if (indexPath.section==0) {
        return 200;
    }
    return UITableViewAutomaticDimension;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.dataArray.count>0) {
        if (section==self.dataArray.count) {
            if (self.rule.length==0) {
                return 0.01f;
            }
            return AUTO(44);
        }
        if (section==0) {
            return AUTO(44);
        }
        return 0;
    }
    return AUTO(44);

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
        JCTeamMatchInfoTimeChooseView *headView = [JCTeamMatchInfoTimeChooseView new];
    headView.titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    if (self.dataArray.count>0) {
        

        if (section==self.dataArray.count) {
            
            headView.titleLab.text = self.rule.length>0?@"赛制说明":@"";
            headView.selView.hidden = YES;
        }else{
            if (self.type==1) {
                headView.titleLab.text = @"联赛";
            }
            if (self.type==2) {
                headView.titleLab.text = @"杯赛";
            }
            if (self.type==3) {
                headView.titleLab.text = @"友谊赛";
            }
            if (self.type==1) {
                headView.timeLab.text = @"";
                headView.selView.hidden = YES;
            }
            if (self.type==2||self.type==3) {
//                JCEventScoreXiaoZuSelModel *model = self.dataArray[section];
    //            headView.titleLab.text = model.sel;
                headView.timeLab.text = self.currentGroupName;
                if (self.timeArray.count>1) {
                    headView.selView.hidden = NO;
                }else{
                    headView.selView.hidden = YES;
                }
                WeakSelf;
                headView.JCChooseBlock = ^{
                    [weakSelf showPickerView];
                };
            }
            
            
        }
    }else{
        if (section==1) {
            
            headView.titleLab.text = self.rule.length>0?@"赛制说明":@"";
            headView.selView.hidden = YES;
        }else{
            if (self.type==1) {
                headView.titleLab.text = @"联赛";
            }
            if (self.type==2) {
                headView.titleLab.text = @"杯赛";
            }
            if (self.type==3) {
                headView.titleLab.text = @"友谊赛";
            }
            if (self.type==1) {
                headView.timeLab.text = @"";
                headView.selView.hidden = YES;
            }
            if (self.type==2||self.type==3) {
//                JCEventScoreXiaoZuSelModel *model = self.dataArray[section];
    //            headView.titleLab.text = model.sel;
                headView.timeLab.text = self.currentGroupName;
                if (self.timeArray.count>1) {
                    headView.selView.hidden = NO;
                }else{
                    headView.selView.hidden = YES;
                }
                WeakSelf;
                headView.JCChooseBlock = ^{
                    [weakSelf showPickerView];
                };
            }
            
            
        }
        
    }
    //    headView.lineView.hidden = YES;


        
        return headView;

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    if (section==self.dataArray.count&&self.dataArray.count>0) {
        return AUTO(8);
    }
    return 0.001f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    [tableView bringSubviewToFront:cell];
//
//}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//
//  NSArray *vicells =  [self.tableView visibleCells];
//
//    for (UITableViewCell *vcell in vicells) {
//
//        [self.tableView bringSubviewToFront:vcell];
//
//    }
//
//}

- (void)showPickerView
{
    [ZJPickerView clear];

    // 1.Custom propery（自定义属性，根据需要添加想要的属性。PS：如果在多个地方使用到自定义弹框，建议把propertyDict定义为一个宏或全局变量）
    NSDictionary *propertyDict = @{
//                                   ZJPickerViewPropertyCanceBtnTitleKey : @"取消",
//                                   ZJPickerViewPropertySureBtnTitleKey  : @"确定",
                                   ZJPickerViewPropertyTipLabelTextKey  : @"选择比赛", // @"提示内容"，多列时推荐使用英文逗号隔开，参考注释
//                                   ZJPickerViewPropertyDividedSymbolKey : @"#", // 选中内容的分隔符，默认英文逗号

                                   ZJPickerViewPropertyCanceBtnTitleColorKey : JCBlackColor,
                                   ZJPickerViewPropertySureBtnTitleColorKey : JCBlackColor,
                                   ZJPickerViewPropertyTipLabelTextColorKey : COLOR_98989F,
                                   ZJPickerViewPropertyLineViewBackgroundColorKey : COLOR_DDDDDD,
                                   ZJPickerViewPropertyCanceBtnTitleFontKey : [UIFont systemFontOfSize:17.0f],
                                   ZJPickerViewPropertySureBtnTitleFontKey : [UIFont systemFontOfSize:17.0f],
                                   ZJPickerViewPropertyTipLabelTextFontKey : [UIFont systemFontOfSize:17.0f],
                                   ZJPickerViewPropertyPickerViewHeightKey : @300.0f,
                                   ZJPickerViewPropertyOneComponentRowHeightKey : @40.0f,
                                   ZJPickerViewPropertySelectRowTitleAttrKey : @{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont systemFontOfSize:20.0f]},
                                   ZJPickerViewPropertyUnSelectRowTitleAttrKey : @{NSForegroundColorAttributeName : COLOR_999999, NSFontAttributeName : [UIFont systemFontOfSize:20.0f]},
                                   ZJPickerViewPropertySelectRowLineBackgroundColorKey : JCClearColor,
                                   ZJPickerViewPropertyIsTouchBackgroundHideKey : @YES,
//                                   ZJPickerViewPropertyIsShowTipLabelKey : @YES,
                                   ZJPickerViewPropertyIsShowSelectContentKey : @YES,
                                   ZJPickerViewPropertyIsScrollToSelectedRowKey: @YES,
//                                   ZJPickerViewPropertyIsDividedSelectContentKey: @YES, // 选择的内容是否已经用英文逗号隔开
                                   ZJPickerViewPropertyIsAnimationShowKey : @YES};
    
    // 2.Show（显示）
//    __weak typeof(_selectContentLabel) weak_selectContentLabel = _selectContentLabel;
    [ZJPickerView zj_showWithDataList:self.timeTitleArray propertyDict:propertyDict completion:^(NSString *selectContent) {
        NSLog(@"ZJPickerView log tip：---> selectContent:%@", selectContent);
        [self.timeArray enumerateObjectsUsingBlock:^(JCEventStageModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {

            if ([selectContent isEqualToString:obj.name_zh]) {
//                self.dataArray = [NSMutableArray arrayWithObject:obj];
                self.currentGroupName = obj.name_zh;
                self.stage_id = obj.id;
                [self refreshData];
                [self.tableView reloadData];
            }
        }];

    }];
}

- (NSMutableArray *)timeArray {
    if (!_timeArray) {
        _timeArray = [NSMutableArray array];
    }
    return _timeArray;
}

- (NSMutableArray *)timeTitleArray {
    if (!_timeTitleArray) {
        _timeTitleArray = [NSMutableArray array];
    }
    return _timeTitleArray;
}
@end
