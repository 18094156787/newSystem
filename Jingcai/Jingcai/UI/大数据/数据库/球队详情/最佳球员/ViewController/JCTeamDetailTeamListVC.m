//
//  JCTeamDetailTeamListVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailTeamListVC.h"
#import "JCTeamMatchInfoTeamHeadView.h"
#import "JCTeamMatchInfoUserTypeCell.h"
#import "JCTeamMatchInfoTeamTableView.h"
#import "JCEventScorePlayerInfoModel.h"
#import "JCTeamMatchInfoTimeChooseView.h"
#import "JCTeamDetailPlayerTableView.h"
#import "JCTeamDetailPlayerTimeModel.h"
#import "JCTeamDetailPlayerSeasonModel.h"
#import "ZJPickerView.h"
@interface JCTeamDetailTeamListVC ()

@property (nonatomic,strong) JCTeamMatchInfoTimeChooseView *selHeadView;

@property (nonatomic,strong) JCTeamMatchInfoTeamHeadView *headView;

@property (nonatomic,strong) JCTeamDetailPlayerTableView *infoTableView;

@property (nonatomic,strong) JCEventScorePlayerInfoModel *selModel;//用来记录选中的

@property (nonatomic,strong) NSString *season_id;

@property (nonatomic,strong) NSMutableArray *timeArray;

@property (nonatomic,strong) NSArray *timeInfoArray;

@end

@implementation JCTeamDetailTeamListVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.season_id = @"0";
    [self initViews];
//    [self refreshData];
    [self getSeasonList];
    [ZJPickerView clear];
}

- (void)refreshData {
    [self.fatherView showLoading];
    
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseEventPlayerOrTeamLeftInfoWithType:@"1" success:^(id  _Nullable object) {
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.headView.hidden = NO;
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCEventScorePlayerInfoModel class]];
            [array enumerateObjectsUsingBlock:^(JCEventScorePlayerInfoModel  *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (idx==0) {
                    obj.is_select = YES;
                    self.selModel = obj;
                    *stop = YES;
                    [self getDataListWithType:obj.field];
                }

            }];
            self.dataArray = [NSMutableArray arrayWithArray:array];
//            self.infoTableView.dataArray = self.selModel.info;
            [self.tableView reloadData];
            self.infoTableView.hidden  = self.dataArray.count==0?YES:NO;
            if (self.dataArray.count>0) {
                [self.view hideNoData];

            }else{
                [self.view showTopNoData];
            }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];
    

}

- (void)getDataListWithType:(NSString *)type {
    [self.fatherView showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseTeamPlayerListInfoWithTeam_id:self.team_id type:type season_id:NonNil(self.season_id) Page:self.pageNo success:^(id  _Nullable object) {
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCEventScorePlayerModel class]];
            NSArray *dataSource = [NSMutableArray arrayWithArray:array];
            self.infoTableView.dataArray = dataSource;

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];


}

- (void)getSeasonList {
//    [self.fatherView showLoading];

    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseSeasonListWithType:@"2" teamID:self.team_id success:^(id  _Nullable object) {
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
                self.timeArray = [NSMutableArray array];
    
                if (self.timeInfoArray.count==0) {
                    self.timeInfoArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCTeamDetailPlayerTimeModel class]];
                }
                [self.timeInfoArray enumerateObjectsUsingBlock:^(JCTeamDetailPlayerTimeModel *infoModel, NSUInteger idx, BOOL * _Nonnull stop) {
    
                    NSMutableArray *timeArray = [NSMutableArray array];
                    [infoModel.season_list enumerateObjectsUsingBlock:^(JCTeamDetailPlayerSeasonModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        [timeArray addObject:obj.year];
                    }];
    
                    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
                    [dataDic setValue:timeArray forKey:infoModel.comp_name];
                    [self.timeArray addObject:dataDic];
                }];
                if (self.timeInfoArray.count>0&&self.selHeadView.titleLab.text.length==0) {
                    JCTeamDetailPlayerTimeModel *infoModel = self.timeInfoArray.firstObject;
                    self.selHeadView.titleLab.text = infoModel.comp_name;
                    if (infoModel.season_list.count>0) {
                        JCTeamDetailPlayerSeasonModel *seasonModel = infoModel.season_list.firstObject;
                        self.selHeadView.timeLab.text  = seasonModel.year;
                        self.season_id = seasonModel.id;
                        [self refreshData];
                    }
                }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];

}

- (void)initViews {
    
    self.selHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(44));
    self.selHeadView.changeSize = YES;
    [self.view addSubview:self.selHeadView];
    WeakSelf;
    self.selHeadView.JCChooseBlock = ^{
        [weakSelf showPickerView];
    };

    
    self.headView.frame = CGRectMake(0, AUTO(44), SCREEN_WIDTH, AUTO(32));
    [self.view addSubview:self.headView];

    
    self.tableView.separatorStyle = 0;
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(32+44));
        make.left.equalTo(self.view);
        make.width.mas_equalTo(AUTO(90));
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view);
            // Fallback on earlier versions
        }
    }];
    
    [self.view addSubview:self.infoTableView];
    [self.infoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(32+44));
        make.right.equalTo(self.view);
        make.left.equalTo(self.tableView.mas_right);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view);
            // Fallback on earlier versions
        }
    }];

    [self.tableView registerClass:[JCTeamMatchInfoUserTypeCell class] forCellReuseIdentifier:@"JCTeamMatchInfoUserTypeCell"];

    
    
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCTeamMatchInfoUserTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoUserTypeCell"];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return AUTO(40);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCEventScorePlayerInfoModel *model = self.dataArray[indexPath.row];
    self.selModel.is_select = NO;
    model.is_select = YES;
    self.selModel = model;
    [self getDataListWithType:model.field];
//    self.infoTableView.dataArray = self.selModel.info;
    [self.tableView reloadData];
}

- (void)showPickerView
{

    [ZJPickerView clear];
//    self.timeArray = @[@"4-12",@"5-17",@"5-7"];
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

        // show select content
        NSArray *selectStrings = [selectContent componentsSeparatedByString:@","];
        if (selectStrings.count>=2) {
            NSString *eventName = selectStrings.firstObject;
            NSString *seasonName = selectStrings[1];
            [self.timeInfoArray enumerateObjectsUsingBlock:^(JCTeamDetailPlayerTimeModel *infoModel, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([eventName isEqualToString:infoModel.comp_name]) {
                    [infoModel.season_list enumerateObjectsUsingBlock:^(JCTeamDetailPlayerSeasonModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        if ([seasonName isEqualToString:obj.year]) {
                            self.season_id = obj.id;
                            self.selHeadView.titleLab.text = infoModel.comp_name;
                            self.selHeadView.timeLab.text = obj.year;
                            [self refreshData];
                            
                            *stop = YES;
                        }
                    }];
                    
                    
                    *stop = YES;
                }
                
            }];
        }

    }];

}

- (JCTeamMatchInfoTeamHeadView *)headView {
    if (!_headView) {
        _headView = [JCTeamMatchInfoTeamHeadView new];
        _headView.hidden = YES;
        _headView.teamLab.text = @"球员";
    }
    return _headView;
}

- (JCTeamDetailPlayerTableView *)infoTableView {
    if (!_infoTableView) {
        _infoTableView = [JCTeamDetailPlayerTableView new];
    }
    return _infoTableView;
}

- (JCTeamMatchInfoTimeChooseView *)selHeadView {
    if (!_selHeadView) {
        _selHeadView = [JCTeamMatchInfoTimeChooseView new];
    }
    return _selHeadView;
}

@end
