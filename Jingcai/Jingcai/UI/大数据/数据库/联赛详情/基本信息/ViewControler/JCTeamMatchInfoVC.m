//
//  JCTeamMatchInfoVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoVC.h"
#import "JCTeamMatchInfoPlanView.h"
#import "JCDataBaseTitleHeadView.h"
#import "JCTeamMatchInfoTeamCell.h"
#import "JCTeamMatchInfoZhenRongCell.h"
#import "JCTeamMatchInfoZhenRongCell.h"
#import "JCTeamMatchInfoTongJiCell.h"
#import "JCTeamMatchInfoTongJiCommomCell.h"
#import "JCTeamMatchInfoPlanCell.h"
#import "JCTeamMatchInfoTimeChooseView.h"
#import "JCTeamMatchModel.h"
#import "JCTeamMatchTongjiModel.h"
#import "JCDataBaseMatchModel.h"
#import "JCTeamMatchBaseInfoModel.h"
#import "JCTeamMatchPlayerModel.h"
#import "JCTeamMatchZhenRongSelModel.h"
#import "ZJPickerView.h"
#import "JCTeamMatchWMStickVC.h"
#import "JCTeamDetailWMStickVC.h"

@interface JCTeamMatchInfoVC ()

@property (nonatomic,strong) JCTeamMatchInfoPlanView *headView;

@property (nonatomic,strong) NSArray *timeInfoArray;

@property (nonatomic,strong) NSMutableArray *timeArray;

@property (nonatomic,strong) JCTeamMatchModel *matchModel;//最近未来比赛 统一VS

@property (nonatomic,strong) NSArray *playerArray;

@property (nonatomic,strong) NSArray *teamArray;//球队统计

@property (nonatomic,strong) NSArray *statisticsArray;//小项目统计

@property (nonatomic,strong) NSArray *newcomers_upArray;//升班马

@property (nonatomic,strong) NSArray *newcomers_downArray;//降班马

@property (nonatomic,strong) NSArray *divisions_upArray;//高一级联赛

@property (nonatomic,strong) NSArray *divisions_downArray;//低一级联赛

@property (nonatomic,strong) NSString *zhenRongCurrentTime;//当前

@property (nonatomic,strong) NSString *zhenRongTime;//阵容更新时间

@end

@implementation JCTeamMatchInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}

- (void)refreshData {
    [self.fatherView showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseEventBaseInfoWithCompetiton_id:self.competition_id season_id:self.season_id best_lineup_id:@"" success:^(id  _Nullable object) {
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            
            self.matchModel = (JCTeamMatchModel *)[JCWJsonTool entityWithJson:object[@"data"][@"match_info"] class:[JCTeamMatchModel class]];

            //阵容相关
            self.timeArray = [NSMutableArray array];
            if (self.timeInfoArray.count==0) {
                self.timeInfoArray = [JCWJsonTool arrayWithJson:object[@"data"][@"best_lineup"][@"match_group_round"] class:[JCTeamMatchZhenRongSelModel class]];
            }
            [self.timeInfoArray enumerateObjectsUsingBlock:^(JCTeamMatchZhenRongSelModel *infoModel, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.timeArray addObject:infoModel.name_zh];
            }];
            self.playerArray = [NSArray yy_modelArrayWithClass:[JCTeamMatchPlayerModel class] json:object[@"data"][@"best_lineup"][@"palyer_info"]];
            self.zhenRongTime = object[@"data"][@"best_lineup"][@"update_time"];//阵容更新时间
            
            
            if (self.timeArray.count>0&&self.zhenRongCurrentTime.length==0) {
                self.zhenRongCurrentTime = self.timeArray.firstObject;
            }


            //统计
            NSMutableArray *teamArray = [NSMutableArray array];
//            卫冕冠军次数
            JCTeamMatchTongjiModel *wmgj_model = (JCTeamMatchTongjiModel *)[JCWJsonTool entityWithJson:object[@"data"][@"title_holder_team_info"] class:[JCTeamMatchTongjiModel class]];
            wmgj_model.team_type = @"1";
            wmgj_model.most_titles_num = wmgj_model.title_holder_num;
//            夺冠最多
            NSArray *dgzd_array = [NSArray yy_modelArrayWithClass:[JCTeamMatchTongjiModel class] json:object[@"data"][@"most_titles_team_info"]];
            [dgzd_array enumerateObjectsUsingBlock:^(JCTeamMatchTongjiModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.team_type = @"2";
            }];
            if (wmgj_model) {
                [teamArray addObject:wmgj_model];
            }
            if (dgzd_array.count>0) {
                [teamArray addObjectsFromArray:dgzd_array];
            }
            
            
            self.teamArray = [NSArray arrayWithArray:teamArray];
            
            //
            NSMutableArray *statisticsArray = [NSMutableArray array];
            NSString *league_level = [NSString stringWithFormat:@"%@",object[@"data"][@"league_level"]];
            NSString *round_count = [NSString stringWithFormat:@"%@",object[@"data"][@"round_count"]];
            if ([league_level integerValue]>0) {
                JCTeamMatchBaseInfoModel *league_levelModel = [JCTeamMatchBaseInfoModel new];
                league_levelModel.name = @"联赛等级";
                league_levelModel.count = league_level;
                [statisticsArray addObject:league_levelModel];
            }
            if ([round_count integerValue]>0) {
                JCTeamMatchBaseInfoModel *round_countModel = [JCTeamMatchBaseInfoModel new];
                round_countModel.name = @"联赛轮次";
                round_countModel.count = round_count;
                [statisticsArray addObject:round_countModel];
            }
            self.statisticsArray = [NSArray arrayWithArray:statisticsArray];
            
//            self.statisticsArray = [JCWJsonTool arrayWithJson:object[@"data"][@"statistics"] class:[JCTeamMatchBaseInfoModel class]];
//            
//            
            
            self.newcomers_upArray = [JCWJsonTool arrayWithJson:object[@"data"][@"team_up_list"] class:[JCTeamMatchTongjiModel class]];
            self.newcomers_downArray = [JCWJsonTool arrayWithJson:object[@"data"][@"team_down_list"] class:[JCTeamMatchTongjiModel class]];
            self.divisions_upArray = [JCWJsonTool arrayWithJson:object[@"data"][@"competition_up_list"] class:[JCDataBaseMatchModel class]];
            self.divisions_downArray = [JCWJsonTool arrayWithJson:object[@"data"][@"competition_down_list"] class:[JCDataBaseMatchModel class]];
            

            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];


}

- (void)getZhenRongDataWithID:(NSString *)best_lineup_id {
    [self.jcWindow showLoading];
    
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseEventBaseInfo_ZhenRongWithCompetiton_id:self.competition_id best_lineup_id:best_lineup_id success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.zhenRongTime = object[@"data"][@"update_time"];
            self.playerArray = [NSArray yy_modelArrayWithClass:[JCTeamMatchPlayerModel class] json:object[@"data"][@"palyer_info"]];
            [self.tableView reloadSection:1 withRowAnimation:UITableViewRowAnimationNone];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];

}


- (void)initViews {
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(100));
    
    
    self.tableView.separatorColor = COLOR_F4F6F9;
    
    [self.tableView registerClass:[JCTeamMatchInfoPlanCell class] forCellReuseIdentifier:@"JCTeamMatchInfoPlanCell"];
    [self.tableView registerClass:[JCTeamMatchInfoTeamCell class] forCellReuseIdentifier:@"JCTeamMatchInfoTeamCell"];
    [self.tableView registerClass:[JCTeamMatchInfoZhenRongCell class] forCellReuseIdentifier:@"JCTeamMatchInfoZhenRongCell"];
    [self.tableView registerClass:[JCTeamMatchInfoTongJiCell class] forCellReuseIdentifier:@"JCTeamMatchInfoTongJiCell"];
    [self.tableView registerClass:[JCTeamMatchInfoTongJiCommomCell class] forCellReuseIdentifier:@"JCTeamMatchInfoTongJiCommomCell"];
    
    
    
}



#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0&&self.matchModel) {
        return 1;
    }
    if (section==1&&self.playerArray.count>0) {
        return 1;
    }
    if (section==2) {
        return self.teamArray.count>0?1:0;
    }
    if (section==3) {
        return self.statisticsArray.count;
    }
    if (section==4) {
        return self.newcomers_upArray.count;
    }
    if (section==5) {
        return self.newcomers_downArray.count;
    }
    if (section==6) {
        return self.divisions_upArray.count;
    }
    if (section==7) {
        return self.divisions_downArray.count;
    }

    
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCTeamMatchInfoPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoPlanCell"];
        cell.model= self.matchModel;
        return cell;
    }

    
    if (indexPath.section==1) {
        if (self.playerArray.count>0) {
            JCTeamMatchInfoZhenRongCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoZhenRongCell"];
            cell.dataArray = self.playerArray;
            cell.zhenRongTime = self.zhenRongTime;
            return cell;
        }

    }
    if (indexPath.section==2) {
        JCTeamMatchInfoTongJiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoTongJiCell"];
        cell.dataSource = self.teamArray;
        return cell;
    }
    if (indexPath.section==3) {
        JCTeamMatchInfoTongJiCommomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoTongJiCommomCell"];
        cell.model = self.statisticsArray[indexPath.row];
        return cell;
    }
    JCTeamMatchInfoTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoTeamCell"];
    if (indexPath.section==4) {
        cell.matchModel = self.newcomers_upArray[indexPath.row];
        return cell;
    }
    if (indexPath.section==5) {
        cell.matchModel = self.newcomers_downArray[indexPath.row];
        return cell;
    }
    if (indexPath.section==6) {
        cell.model = self.divisions_upArray[indexPath.row];
        return cell;
    }
    if (indexPath.section==7) {
        cell.model = self.divisions_downArray[indexPath.row];
        return cell;
    }
    UITableViewCell *tableViewcell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
     return tableViewcell;

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0&&self.matchModel) {
        return AUTO(110);
    }
    if (indexPath.section==1) {
        if (self.playerArray.count>0) {
            float height = SCREEN_WIDTH-AUTO(30)+AUTO(35);
            return height+AUTO(8);
        }else{
            return 0.001f;
        }

    }
    if (indexPath.section==2) {
        if (self.teamArray.count==0) {
            return 0.001f;;
        }
        NSInteger height = ceil(self.teamArray.count/2.0f);
        return height*75;

    }
    if (indexPath.section==3) {
        return AUTO(44);
    }
    if (indexPath.section>3&&indexPath.section<=7) {
        return AUTO(44);
    }
    return 0.001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==1&&self.playerArray.count>0) {
        return AUTO(44);
      }
    if (section==2&&self.teamArray.count>0) {
          
          return AUTO(44);
      }

      if (section==4&&self.newcomers_upArray.count>0) {
          return AUTO(44);
      }
      if (section==5&&self.newcomers_downArray.count>0) {

          return AUTO(44);
      }
      
      if (section==6&&self.divisions_upArray.count>0) {
          return AUTO(44);
      }
      if (section==7&&self.divisions_downArray.count>0) {

          return AUTO(44);
      }
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JCDataBaseTitleHeadView *headView = [JCDataBaseTitleHeadView new];
    headView.titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    headView.lineView.hidden = YES;
    if (section==1&&self.playerArray.count>0) {
        JCTeamMatchInfoTimeChooseView *zhenRongHeadView = [JCTeamMatchInfoTimeChooseView new];
        zhenRongHeadView.titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
        zhenRongHeadView.titleLab.text = @"最佳阵容";
        zhenRongHeadView.timeLab.text = NonNil(self.zhenRongCurrentTime);
        WeakSelf;
        zhenRongHeadView.JCChooseBlock = ^{
            [weakSelf showPickerView];
        };

        return zhenRongHeadView;
    }
    if (section==2&&self.teamArray.count>0) {
        headView.titleLab.text = @"统计";
//        headView.lineView.hidden = NO;
        return headView;
    }

    if (section==4&&self.newcomers_upArray.count>0) {
        headView.titleLab.text = @"升班马";
//        headView.lineView.hidden = NO;
        return headView;
    }
    if (section==5&&self.newcomers_downArray.count>0) {
        headView.titleLab.text = @"降班马";
//        headView.lineView.hidden = NO;
        return headView;
    }
    
    if (section==6&&self.divisions_upArray.count>0) {
        headView.titleLab.text = @"高级别联赛";
//        headView.lineView.hidden = NO;
        return headView;
    }
    if (section==7&&self.divisions_downArray.count>0) {
        headView.titleLab.text = @"低级别联赛";
//        headView.lineView.hidden = NO;
        return headView;
    }

    return [UIView new];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==0) {
         return AUTO(9);
      }
      if (section==1&&self.playerArray.count>0) {
          
          return AUTO(9);
      }
    
//    if (section==1&&self.playerArray.count>0) {
//        return 1;
//    }
    if (section==2&&(self.teamArray.count>0||self.statisticsArray.count>0)) {
        return 0.5;
    }
    

      if (section==3&&self.newcomers_upArray.count>0) {
          return AUTO(9);
      }
      if (section==4&&self.newcomers_downArray.count>0) {

          return AUTO(9);
      }
      
      if (section==5&&self.divisions_upArray.count>0) {
          return AUTO(9);
      }
      if (section==6&&self.divisions_downArray.count>0) {

          return AUTO(9);
      }
    return 0.001f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F0F0F0;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        NSLog(@"%@",[self getViewController]);
        JCMatchDetailWMStickVC *vc = [JCMatchDetailWMStickVC new];
        vc.matchNum = self.matchModel.match_id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section==4) {
        JCTeamMatchTongjiModel *model = self.newcomers_upArray[indexPath.row];
        JCTeamDetailWMStickVC *vc = [JCTeamDetailWMStickVC new];
        vc.team_id = model.team_id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section==5) {
        JCTeamMatchTongjiModel *model = self.newcomers_downArray[indexPath.row];
        JCTeamDetailWMStickVC *vc = [JCTeamDetailWMStickVC new];
        vc.team_id = model.team_id;
        [self.navigationController pushViewController:vc animated:YES];

    }
    
    
    
    if (indexPath.section>=6&&indexPath.section<=7) {
        JCTeamMatchWMStickVC *vc = [JCTeamMatchWMStickVC new];
        if (indexPath.section==6) {
            JCDataBaseMatchModel *model = self.divisions_upArray[indexPath.row];
            vc.competition_id = model.competition_id;
        }
        if (indexPath.section==7) {
            JCDataBaseMatchModel *model = self.divisions_downArray[indexPath.row];
            vc.competition_id = model.competition_id;
        }
        [self.navigationController pushViewController:vc animated:YES];
    }
//    NSLog(@"%ld",indexPath.section);
}

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
        [self.timeInfoArray enumerateObjectsUsingBlock:^(JCTeamMatchZhenRongSelModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([selectContent isEqualToString:obj.name_zh]) {
                self.zhenRongCurrentTime = obj.name_zh;
                [self getZhenRongDataWithID:obj.best_lineup_id];
                *stop = YES;
//                [self.tableView reloadSection:1 withRowAnimation:UITableViewRowAnimationNone];
            }
        }];

    }];
}

- (JCTeamMatchInfoPlanView *)headView {
    if (!_headView) {
        _headView = [JCTeamMatchInfoPlanView new];
    }
    return _headView;
}

@end
