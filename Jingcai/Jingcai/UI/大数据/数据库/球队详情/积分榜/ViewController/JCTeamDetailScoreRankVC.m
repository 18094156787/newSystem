//
//  JCTeamDetailScoreRankVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailScoreRankVC.h"
#import "JCDataBaseTitleHeadView.h"
#import "JCTeamMatchInfoScoreLianSaiCell.h"
#import "JCTeamMatchInfoScoreRuleCell.h"
#import "JCTeamMatchInfoScoreXioaZuCell.h"
#import "JCEventScoreLianSaiSelModel.h"
#import "JCEventScoreXiaoZuSelModel.h"
#import "JCTeamMatchInfoTimeChooseView.h"
#import "ZJPickerView.h"
#import "JCTeamDetailScoreTimeModel.h"
#import "JCTeamDetailPlayerTimeModel.h"
#import "JCTeamDetailPlayerTimeModel.h"

@interface JCTeamDetailScoreRankVC ()

@property (nonatomic,assign) NSInteger type;//1是联赛 2是分组赛

@property (nonatomic,strong) NSString *rule;

@property (nonatomic,strong) NSArray *dataSourceArray;

@property (nonatomic,strong) NSMutableArray *timeInfoArray;

@property (nonatomic,strong) NSMutableArray *timeArray;

@property (nonatomic,strong) NSString *promotion_name;

@property (nonatomic,strong) NSString *table_id;

@property (nonatomic,strong) NSString *selTime;



@end

@implementation JCTeamDetailScoreRankVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.table_id = @"0";
    [self initViews];
    [self getSeasonList];
//    [self refreshData];
    [ZJPickerView clear];
}

- (void)getSeasonList {
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseSeasonListWithType:@"1" teamID:self.team_id success:^(id  _Nullable object) {
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.timeArray = [NSMutableArray array];
            self.timeInfoArray = [NSMutableArray array];
            NSArray *dataArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCTeamDetailPlayerTimeModel class]];
            [dataArray enumerateObjectsUsingBlock:^(JCTeamDetailPlayerTimeModel *infoModel, NSUInteger idx, BOOL * _Nonnull stop) {

//                NSMutableArray *timeArray = [NSMutableArray array];
                [infoModel.season_list enumerateObjectsUsingBlock:^(JCTeamDetailPlayerSeasonModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                    [timeArray addObject:obj.year];
                    JCTeamDetailPlayerSeasonModel *model = [JCTeamDetailPlayerSeasonModel new];
                    model.id = obj.id;
                    model.stage_id= obj.stage_id;
                    NSString *season_name = [NSString stringWithFormat:@"%@ %@ %@",obj.year,infoModel.comp_name,obj.stage_name];
                    model.season_name = season_name;
                    [self.timeArray addObject:season_name];
                    [self.timeInfoArray addObject:model];
                }];

//                NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
//                [dataDic setValue:timeArray forKey:infoModel.comp_name];
//                [self.timeArray addObject:dataDic];
            }];
            if (self.timeArray.count>0) {
                self.selTime = self.timeArray.firstObject;
            }
            if (self.timeInfoArray.count>0) {
                JCTeamDetailPlayerSeasonModel *model = self.timeInfoArray.firstObject;
                self.season_id = model.id;
                self.stage_id = model.stage_id;
            }
            [self refreshData];



        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];

}

- (void)refreshData {
    [self.fatherView showLoading];
    
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseScoreRankWithType:@"1" competiton_id:self.team_id Season_id:self.season_id stage_id:NonNil(self.stage_id) Success:^(id  _Nullable object) {
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

            [self.tableView reloadData];

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

    return self.dataArray.count+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

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

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    if (section==self.dataArray.count&&self.rule.length==0) {
//        return 0.001f;
//    }
//    return AUTO(44);
    if (section==0) {
        return AUTO(44);
    }
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        JCTeamMatchInfoTimeChooseView *headView = [JCTeamMatchInfoTimeChooseView new];
    //    headView.lineView.hidden = YES;
        headView.titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
        
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
//            if (self.type==1) {
//                headView.timeLab.text = @"";
//                headView.selView.hidden = YES;
//            }
//            if (self.type==2||self.type==3) {
//                JCEventScoreXiaoZuSelModel *model = self.dataArray[section];
    //            headView.titleLab.text = model.sel;
                headView.timeLab.text = self.selTime;
                if (self.timeArray.count>1) {
                    headView.selView.hidden = NO;
                }else{
                    headView.selView.hidden = YES;
                }
                WeakSelf;
                headView.JCChooseBlock = ^{
                    [weakSelf showPickerView];
                };
//            }
            
            
        }

        
        return headView;

    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    if (section==0&&self.dataArray.count>0) {
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
    [ZJPickerView zj_showWithDataList:self.timeArray propertyDict:propertyDict completion:^(NSString *selectContent) {
        NSLog(@"ZJPickerView log tip：---> selectContent:%@", selectContent);
        [self.timeInfoArray enumerateObjectsUsingBlock:^(JCTeamDetailPlayerSeasonModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([selectContent isEqualToString:obj.season_name]) {
                self.season_id = obj.id;
                self.stage_id = obj.stage_id;
                self.selTime = selectContent;
                [self refreshData];
                *stop = YES;
//                [self.tableView reloadData];
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

@end
