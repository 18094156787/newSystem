//
//  JCCommunity_HBVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCCommunity_HBVC.h"
#import "JCCommentCell.h"
#import "JCCommunity_HB_HeadView.h"
#import "JCHongbangWMstckyVC.h"
#import "JCHongbangCommomCell.h"
#import "JCMatchDetailWMStickVC.h"
#import "JCCommunityRankInfoModel.h"
#import "JCCommunity_HB_SelHeadView.h"
#import "ZJPickerView.h"
#import "JCTuiJianManager.h"
@interface JCCommunity_HBVC ()

@property (nonatomic,strong) JCCommunity_HB_HeadView *headView;

@property (nonatomic,strong) JCCommunity_HB_SelHeadView *selView;

@property (nonatomic,strong) NSArray *selArray;

@property (nonatomic,strong) NSArray *tjDataArr;

@property (nonatomic,assign) NSInteger type;//type 1是全部 2是足彩 3是让球4是进球数 5是免费

@property (nonatomic,strong) NSString *end;

@property (nonatomic,strong) NSString *tuijianid;

@property (nonatomic,strong) NSArray *rankArray;



@end

@implementation JCCommunity_HBVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
    [self.headView reloadIndex];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"红榜达人";
    self.type = 0;
    self.end = @"";
    [self initViews];
    [self getCache];
    [self refreshData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogin object:nil];
    
}

- (void)refreshData {
    self.pageNo = 1;
    self.tuijianid = @"";
    self.end = @"";
    [self getDataList];
    [self getExpertList];
}

- (void)getExpertList {
    WeakSelf;
    [[UIApplication sharedApplication].keyWindow showLoading];
    JCCommunityService_New *service = [JCCommunityService_New service];
    [service getCommunity_HongbangExpertLsitWithSuccess:^(id  _Nullable object) {
        [self endRefresh];
        [[UIApplication sharedApplication].keyWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {

            NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:JCCommunity_HB];
            
            self.rankArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCCommunityRankInfoModel class]];
            self.headView.dataSource = self.rankArray;

        }
    } failure:^(NSError * _Nonnull error) {
        [[UIApplication sharedApplication].keyWindow endLoading];
        [weakSelf endRefresh];
    }];

}

- (void)getDataList {
    WeakSelf;
    [[UIApplication sharedApplication].keyWindow showLoading];
    JCCommunityService_New *service = [JCCommunityService_New service];
    [service getCommunity_HongbangTuijianLsitWithType:[NSString stringWithFormat:@"%ld",self.type] page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
        [[UIApplication sharedApplication].keyWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {

            if (self.pageNo==1) {

                [self.dataArray removeAllObjects];

            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCHongBangBall class]];
            [self.dataArray addObjectsFromArray:array];

            [self.tableView reloadData];
            if (array.count < PAGE_LIMIT) {
                [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
            }

            [self showNoDataView];
            self.pageNo++;
            if (self.dataArray.count==0) {
                UIView *footView = [UIView new];
                footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(380));
                self.tableView.tableFooterView = footView;
            }else{
                self.tableView.tableFooterView = [UIView new];
            }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [[UIApplication sharedApplication].keyWindow endLoading];
        [weakSelf endRefresh];
    }];

}


- (void)getCache {
  
    
    id object_data = [[NSUserDefaults standardUserDefaults] objectForKey:JCCommunity_HB];
    id object = [JCWAppTool dictionaryForJsonData:object_data];
    NSLog(@"红榜缓存%@",object);
    if (object) {
        [self deathWithData:object];
    }
}

- (void)deathWithData:(id)object {

    self.rankArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCCommunityRankInfoModel class]];
    self.headView.dataSource = self.rankArray;
}


- (void)initViews {
    WeakSelf;
    self.headView.JCSelectBlock = ^(NSInteger count) {
        if (count<4) {
            weakSelf.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(160));
        }else{
            weakSelf.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(280));
        }
        weakSelf.tableView.tableHeaderView = weakSelf.headView;
    };

    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(280));
    self.tableView.tableHeaderView = self.headView;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 表格注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"JCCommentCell" bundle:nil] forCellReuseIdentifier:@"JCCommentCell"];
    [self.tableView registerClass:[JCHongbangCommomCell class] forCellReuseIdentifier:@"JCHongbangCommomCell"];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];

    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = AUTO(280);
    self.tableView.ly_emptyView = emptyView;
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.end = @"";
        weakSelf.tuijianid = @"";
        [weakSelf refreshData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 0;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
//    JCCommentCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCCommentCell"];
    JCHongbangCommomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangCommomCell"];
    
    cell.dianPingBall = self.dataArray[indexPath.section-1];
    cell.lineView.hidden = YES;
    WeakSelf;
    cell.matchClickBlock = ^(NSString *matchNum) {
        JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];
        detailVC.matchNum = matchNum;
        [weakSelf.navigationController pushViewController:detailVC animated:YES];
    };
    cell.userClickBlock = ^(NSString * _Nullable tjUserId) {
        JCHongbangWMstckyVC * userVC = [JCHongbangWMstckyVC new];
        userVC.autherID = tjUserId;
        [weakSelf.navigationController pushViewController:userVC animated:YES];
    };
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCHongBangBall * dianPingBall = self.dataArray[indexPath.section-1];
    
//    // 查看需要登录
//    if (![JCWUserBall currentUser]) {
//        [self presentLogin];
//        return ;
//    }
    // 支付的处理
    [JCTuiJianManager getTuiJianDetailWithTuiJianID:dianPingBall.base_info.tuijian_id orderID:@"" type:@"" WithViewController:self is_push:YES success:^{
        
    }];
    
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    JCDianPingBall * dianPingBall = self.dataArray[indexPath.row];
    
//    return AUTO(130)+dianPingBall.match_data.count*AUTO(20)+10;
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==0) {
        WeakSelf;
        [self.selView.selectBtn bk_whenTapped:^{
            [weakSelf showPickerView];
        }];
        return self.selView;
    }
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F0F0F0;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return AUTO(54);
    }
    if (section==1) {
        return 0.01;
    }

    return AUTO(8);
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    footView.backgroundColor = COLOR_F6F6F6;
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return AUTO(5);
    return 0.001;
}

#pragma mark lazyload


//分割线至顶部
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    }
    //
}

- (void)showPickerView
{

    [ZJPickerView clear];
    // 1.Custom propery（自定义属性，根据需要添加想要的属性。PS：如果在多个地方使用到自定义弹框，建议把propertyDict定义为一个宏或全局变量）
    NSDictionary *propertyDict = @{
//                                   ZJPickerViewPropertyCanceBtnTitleKey : @"取消",
//                                   ZJPickerViewPropertySureBtnTitleKey  : @"确定",
                                   ZJPickerViewPropertyTipLabelTextKey  : @"筛选方案", // @"提示内容"，多列时推荐使用英文逗号隔开，参考注释
//                                   ZJPickerViewPropertyDividedSymbolKey : @"#", // 选中内容的分隔符，默认英文逗号

                                   ZJPickerViewPropertyCanceBtnTitleColorKey : JCBlackColor,
                                   ZJPickerViewPropertySureBtnTitleColorKey : JCBlackColor,
                                   ZJPickerViewPropertyTipLabelTextColorKey : COLOR_98989F,
                                   ZJPickerViewPropertyLineViewBackgroundColorKey : COLOR_DDDDDD,
                                   ZJPickerViewPropertyCanceBtnTitleFontKey : [UIFont systemFontOfSize:16.0f],
                                   ZJPickerViewPropertySureBtnTitleFontKey : [UIFont systemFontOfSize:16.0f],
                                   ZJPickerViewPropertyTipLabelTextFontKey : [UIFont systemFontOfSize:16.0f],
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
    [ZJPickerView zj_showWithDataList:self.selArray propertyDict:propertyDict completion:^(NSString *selectContent) {
        NSLog(@"ZJPickerView log tip：---> selectContent:%@", selectContent);
        if ([self.selArray containsObject:selectContent]) {

             NSInteger index = [self.selArray indexOfObject:selectContent];

            self.type = index;
            [self refreshData];
            [self.selView.selectBtn setTitle:selectContent forState:0];
        }
       

    }];
}

#pragma mark DataRequest

- (JCCommunity_HB_HeadView *)headView {
    if (!_headView) {
        _headView = [JCCommunity_HB_HeadView new];
    }
    return _headView;
}

- (JCCommunity_HB_SelHeadView *)selView {
    if (!_selView) {
        _selView = [JCCommunity_HB_SelHeadView new];
    }
    return _selView;
}

- (NSArray *)selArray {
    if (!_selArray) {
        _selArray = @[@"全部",@"竞足",@"让球",@"进球数",@"免费"];
    }
    return _selArray;
}

@end
