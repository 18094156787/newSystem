//
//  JCTeamMatchInfoMatchVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoMatchVC.h"
#import "JCTeamMatchInfoMatchCell.h"
#import "JCTeamMatchInfoTimeChooseView.h"
#import "ZJPickerView.h"
#import "JCTeamMatchInfoMatchHeadView.h"
#import "JCTeamMatchInfoMatchContentCell.h"
#import "JCTeamMatchInfoModel.h"
#import "JCTeamMatchTimeInfoModel.h"
#import "JCEventStageModel.h"
@interface JCTeamMatchInfoMatchVC ()

@property (nonatomic,strong) NSArray *timeInfoArray;

@property (nonatomic,strong) NSMutableArray *timeArray;

@property (nonatomic,strong) NSArray *timeRightArray;

@property (nonatomic,strong) JCTeamMatchInfoTimeChooseView *headView;

//@property (nonatomic,strong) NSString *stage_id;//当前的联赛id

@property (nonatomic,strong) NSString *cur_stage_id;//当前的联赛id

@property (nonatomic,assign) NSInteger selectIndex;

@property (nonatomic,assign) NSInteger selectRightIndex;//右侧选中行

@property (nonatomic,strong) NSString *cur_group;

@property (nonatomic,assign)  BOOL scrolluUp;

@property (nonatomic,assign)  BOOL scrolluDown;

@property (nonatomic,assign) BOOL haveLoad;

@property (nonatomic,assign) BOOL userSelect;

@property (nonatomic,assign) NSInteger count;

@end

@implementation JCTeamMatchInfoMatchVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self getStage_list];
//    [self refreshData];
    [ZJPickerView clear];
    [self.tableView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context: nil];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    self.count++;
//    NSLog(@"%ld",self.count);
}

//获取阶段列表
- (void)getStage_list {
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseStage_listWithSeason_id:NonNil(self.season_id) Success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.timeInfoArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCEventStageModel class]];
            JCEventStageModel *cur_stageModel;
            for (JCEventStageModel *stageModel in self.timeInfoArray) {
                if ([self.stage_id isEqualToString:stageModel.id]) {
                    //遍历出当前阶段
                    cur_stageModel = stageModel;
                }
            }
            if (!cur_stageModel) {
//                self.cur_stage_id =
                cur_stageModel = self.timeInfoArray.firstObject;
                self.stage_id = cur_stageModel.id;
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
    [service getDataBaseMatchListWithCompetiton_id:self.event_id Season_id:self.season_id stage_id:self.stage_id Success:^(id  _Nullable object) {
        
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.dataArray = [NSMutableArray array];
            self.cur_stage_id = object[@"data"][@"cur_stage_id"];
           NSString *cur_group = object[@"data"][@"cur_group"];
            NSString *cur_round = object[@"data"][@"cur_round"];
            NSArray *array0 = object[@"data"][@"match_list"];

            JCEventStageModel *cur_stageModel;
            for (JCEventStageModel *stageModel in self.timeInfoArray) {
                if ([self.cur_stage_id isEqualToString:stageModel.id]) {
                    //遍历出当前阶段
                    cur_stageModel = stageModel;
                }
            }
//            if (!cur_stageModel) {
//                cur_stageModel = self.timeInfoArray.firstObject;
//            }
            //根据当前阶段,优先展示组,没有组则展示轮.给数组添加头部
            if ([cur_stageModel.group_count integerValue]>0||[cur_stageModel.round_count integerValue]>0) {
                for (int i=0; i<array0.count; i++) {
                    NSArray *array1 = array0[i];
                    
                    NSArray *array = [JCWJsonTool arrayWithJson:array1 class:[JCTeamMatchModel class]];//
                    JCTeamMatchModel *firstModel = array.firstObject;
                    JCTeamMatchInfoModel *model = [JCTeamMatchInfoModel new];

                    if (firstModel.group_num.length>0) {
                        UniChar ch = i+65;
                        NSString *value = [NSString stringWithFormat:@"%c",ch];
                        model.title = [NSString stringWithFormat:@"%@组",value];
                    }else if (firstModel.round_num.length>0){
                        model.title = [NSString stringWithFormat:@"第%@轮",firstModel.round_num];
                    }
                    model.match = [NSMutableArray arrayWithArray:array];
                    [self.dataArray addObject:model];
                }
            }else{
                //没有组,也没有轮的.则是联赛,这时候的头部是主队vs客队
                for (int i=0; i<array0.count; i++) {
                    NSArray *array1 = array0[i];
                    
                    NSArray *array = [JCWJsonTool arrayWithJson:array1 class:[JCTeamMatchModel class]];//
                    for (JCTeamMatchModel *teamModel in array) {
                        JCTeamMatchInfoModel *model = [JCTeamMatchInfoModel new];
                        model.title = [NSString stringWithFormat:@"%@ vs %@",teamModel.home_team_name,teamModel.away_team_name];
                        model.match = [NSMutableArray arrayWithObject:teamModel];
                        [self.dataArray addObject:model];
                    }

                }
                
            }
            if (self.dataArray.count==0) {
                [self.tableView showTopNoData];
            }else{
                [self.tableView hideNoData];
            }

            [self.tableView reloadData];
            
            self.timeArray = [NSMutableArray array];

            for (JCEventStageModel *stageModel in self.timeInfoArray) {
                NSInteger round_count = [stageModel.round_count intValue];
                NSInteger group_count = [stageModel.group_count intValue];
                NSInteger count = round_count;
                if (group_count>0) {
                    count  = group_count;//默认是第几轮模式
                }
                    NSMutableArray *countArray = [NSMutableArray array];
                    for (int i=0; i<count; i++) {
                        if (group_count>0) {
                            UniChar ch = i+65;
                            NSString *value = [NSString stringWithFormat:@"%c",ch];
                            [countArray addObject:[NSString stringWithFormat:@"%@组",value]];
                            
                        }else{
                            [countArray addObject:[NSString stringWithFormat:@"第%d轮",i+1]];
                        }


                    }
                    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
                    [dataDic setValue:countArray forKey:stageModel.name_zh];
                    [self.timeArray addObject:dataDic];
                    
//                    self.headView.timeLab.text = countArray.firstObject;

            }
            NSInteger round_count = [cur_round intValue];
            NSInteger group_count = [cur_group intValue];
            //遍历出当前联赛阶段是第几轮还是第几组

            [self.timeInfoArray enumerateObjectsUsingBlock:^(JCEventStageModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj.id isEqualToString:self.cur_stage_id]) {
                    self.headView.titleLab.text = obj.name_zh;
                    if (!self.haveLoad) {
                            //第一次加载,如果不是第一次加载,则用上次选中的
                            if ([obj.group_count integerValue]==0&&[obj.round_count integerValue]==0) {
                                self.headView.timeLab.text = @"";
                        }else {
                          
                            if ([obj.group_count integerValue]>0) {
                                UniChar ch = group_count+65;
                                NSString *value = [NSString stringWithFormat:@"%c",ch];
                                self.headView.timeLab.text = [NSString stringWithFormat:@"%@组",value];
                            }else {
                                self.headView.timeLab.text = [NSString stringWithFormat:@"第%ld轮",round_count];
                                
                                
                                
                                if (round_count==0&&[cur_stageModel.round_count integerValue]==1) {
//                                    JCTeamMatchInfoModel *infoModel = self.dataArray.firstObject;
                                    self.headView.timeLab.text = @"第1轮";
                                }

                            }

                        }
                        
                    }
                    
                    

                    *stop = YES;
                }
            }];
            //self.selectRightIndex 定位到第几轮或者第几组,优选展示第几轮
            if (group_count>0) {
                self.selectRightIndex = group_count-1;
            }else if(round_count>0){
                self.selectRightIndex = round_count-1;
            }
            if (self.selectRightIndex<self.dataArray.count) {
                
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:self.selectRightIndex];
                    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
            }

            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.haveLoad = YES;
            });
            


        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];



}

- (void)initViews {
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(44));
    [self.view addSubview:self.headView];
    WeakSelf;
    self.headView.JCChooseBlock = ^{
        [weakSelf showPickerView];
    };
    
    
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(44));
    }];
//    self.tableView.separatorColor = COLOR_F4F6F9;
    [self.tableView registerClass:[JCTeamMatchInfoMatchContentCell class] forCellReuseIdentifier:@"JCTeamMatchInfoMatchContentCell"];

    
    
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCTeamMatchInfoMatchContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCTeamMatchInfoMatchContentCell"];
//    cell.isCircle = indexPath.row==4?NO:YES;
    JCTeamMatchInfoModel *model = self.dataArray[indexPath.section];
    cell.dataArray = model.match;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCTeamMatchInfoModel *model = self.dataArray[indexPath.section];
    return AUTO(75)*model.match.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return AUTO(32);
//    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JCTeamMatchInfoMatchHeadView *headView = [JCTeamMatchInfoMatchHeadView new];
    JCTeamMatchInfoModel *model = self.dataArray[section];
    headView.titleLab.text = model.title;
    return headView;
//    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return AUTO(10);
//    return 0.001f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = JCClearColor;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (self.scrolluUp) {
        if (self.timeRightArray.count>0) {
//            self.selectRightIndex = section;
            NSString *time = self.timeRightArray[section];
            if (self.userSelect) {
                time = self.timeRightArray[self.selectRightIndex];
//                self.userSelect = NO;
            }
            self.headView.timeLab.text = time;
        }
         
    }
   
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (self.scrolluDown) {
         if (self.timeRightArray.count>0) {
//             self.selectRightIndex = section;
             NSString *time = self.timeRightArray[section];
             if (self.userSelect) {
                 time = self.timeRightArray[self.selectRightIndex];
                 self.userSelect = NO;
             }
             self.headView.timeLab.text = time;
         }
    }
}




- (void)showPickerView
{

//    [ZJPickerView clear];
//    self.timeArray = @[@"4-12",@"5-17",@"5-7"];
    // 1.Custom propery（自定义属性，根据需要添加想要的属性。PS：如果在多个地方使用到自定义弹框，建议把propertyDict定义为一个宏或全局变量）
    NSDictionary *propertyDict = @{
//                                   ZJPickerViewPropertyCanceBtnTitleKey : @"取消",
//                                   ZJPickerViewPropertySureBtnTitleKey  : @"确定",
//                                   ZJPickerViewPropertyTipLabelTextKey  : @"选择比赛", // @"提示内容"，多列时推荐使用英文逗号隔开，参考注释
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
//        BOOL containDouhao = [selectContent containsString:@","];
//        if (selectStrings.count==1) {
//            self.headView.titleLab.text = selectStrings.firstObject;
//        }
//        if (!containDouhao) {
//            self.headView.titleLab.text = selectStrings.firstObject;
//        }
        if (selectStrings.count>1) {
            NSString *left = selectStrings.firstObject;//第一列选中的行
            NSString *right = selectStrings[1];//第二列选中的行
            self.headView.titleLab.text = left;
            self.headView.timeLab.text = right;
            self.cur_group = right;
            self.userSelect = YES;

            self.selectRightIndex = 0;
            [self.timeInfoArray enumerateObjectsUsingBlock:^(JCEventStageModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj.name_zh isEqualToString:left]) {
                    for (NSDictionary *dic in self.timeArray) {
                        if (dic[left]) {
                            NSArray *array = dic[left];
                            self.selectRightIndex = [array indexOfObject:right];
                            break;
                            
                        }
                    }


                    if (![self.cur_stage_id isEqualToString:obj.id]) {
                        //两次选择不同才去重新拉取数据
//
                        self.stage_id = obj.id;
                        self.cur_stage_id = obj.id;
                        [self refreshData];

                    }else{
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        if (self.selectRightIndex<self.dataArray.count) {

                            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:self.selectRightIndex];
                            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
//                                [self tableViewScrollow];


                        }

                });

                    }

                    
                    *stop = YES;
                }
            }];
            
            
        }

    }];
//    if (self.timeInfoArray.count>0) {
//        [[ZJPickerView sharedView].pickerView selectRow:self.selectIndex inComponent:0 animated:NO];
//    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isKindOfClass: [UITableView class]]) {
        CGPoint newPoint = [change[@"new"] CGPointValue];
        CGPoint oldPoint = [change[@"old"] CGPointValue];
        CGFloat newPointY = newPoint.y;
        CGFloat oldPointY = oldPoint.y;
        CGFloat frameHeight = ((UITableView *)object).frame.size.height;
        CGFloat contentSizeHeight = ((UITableView *)object).contentSize.height;

        //  这个地方把contentSizeHeight强制转为long类型很重要，因为本身它是CGFloat类型，所以可能会带有浮点数
        // 一般我们在做表格的时候，实际上正数居多，为什么用long而不是int，主要是表示的整数范围会更大
        if ((newPointY < oldPointY && (frameHeight + newPointY) < (long)contentSizeHeight) || newPointY < 0 || oldPointY < 0) {
            if (newPointY <= 0 || oldPointY <= 0) {
                NSLog(@"top");
            } else {
                NSLog(@"scroll down");
                self.scrolluDown = YES;
                self.scrolluUp = NO;
            }
        } else if (newPointY > oldPointY) {
            if ((frameHeight + newPointY >= contentSizeHeight)) {
                NSLog(@"bottom");
            } else {
                NSLog(@"scroll up");
                self.scrolluDown = NO;
                self.scrolluUp = YES;
            }
        }
    }
}

- (void)tableViewScrollow {
//    float height = 0;
//    for (int i=0; i<self.selectRightIndex; i++) {
//        JCTeamMatchInfoModel *model = self.dataArray[i];
//        height = height +model.match.count*AUTO(75);
//    }
//    height = height+AUTO(42)*self.selectRightIndex;
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////                        [self.tableView scrollToRow:0 inSection:0 atScrollPosition:UITableViewScrollPositionTop animated:NO];
////        [self.tableView scrollRectToVisible:CGRectMake(0,0,1,1) animated:YES];
////        [self.tableView scrollRectToVisible:CGRectMake(0,0,SCREEN_WIDTH,height) animated:NO];
//        [self.tableView setContentOffset:CGPointMake(0, height) animated:NO];
//    });

}

- (JCTeamMatchInfoTimeChooseView *)headView {
    if (!_headView) {
        _headView = [JCTeamMatchInfoTimeChooseView new];
    }
    return _headView;
}

- (NSMutableArray *)timeArray {
    if (!_timeArray) {
        _timeArray = [NSMutableArray array];
    }
    return _timeArray;;
}

- (void)dealloc {
    
    @try {
        
        [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
    }
    @catch(NSException *exception) {
        NSLog(@"--%@", exception);
    }
}



@end
