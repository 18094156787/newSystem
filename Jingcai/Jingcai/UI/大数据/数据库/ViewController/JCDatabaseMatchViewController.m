//
//  JCDatabaseMatchViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDatabaseMatchViewController.h"
#import "JCDatabaseCommomMatchCell.h"
#import "JCMatchFilterTitleSectionView.h"
#import "JCDatabaseMatchHeadView.h"
#import "JCDatabaseMatchCell.h"
#import "JCDataBaseAreaCountryModel.h"
#import "JCTeamMatchWMStickVC.h"
#import "JCTeamDetailWMStickVC.h"
@interface JCDatabaseMatchViewController ()

@property(nonatomic,strong) UILabel *titleLab;

@property(nonatomic,strong) UIImageView *areaImgNavView;

@property(nonatomic,strong) NSDictionary *dataDictionary;

@end

@implementation JCDatabaseMatchViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];

}

- (void)refreshData {
    [self.view showLoading];
    
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseAreaListWithSuccess:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *array = object[@"data"];
            for (NSDictionary *dataDic in array) {
                NSString *category_id = dataDic[@"category_id"];
                if ([self.model.category_id integerValue]==[category_id integerValue]) {
                        self.dataDictionary = dataDic;
                    break;
                }
            }
            if (!self.dataDictionary) {
                return;
            }

            NSString *category_id = self.dataDictionary[@"category_id"];
            
            NSArray *dataArray = [JCWJsonTool arrayWithJson:self.dataDictionary[@"country_competition_info"][@"list"] class:[JCDataBaseAreaCountryModel class]];
            JCDataBaseAreaCountryModel *firstModel = [JCDataBaseAreaCountryModel new];
            firstModel.country_logo = self.model.category_img;
            firstModel.name_zh = self.dataDictionary[@"country_competition_info"][@"category_long_name"];
            NSArray *firstModelArray  = [JCWJsonTool arrayWithJson:self.dataDictionary[@"country_competition_info"][@"cate_competition"] class:[JCDataBaseMatchModel class]];
            firstModel.competition_info = firstModelArray;
            
            self.dataArray = [NSMutableArray arrayWithArray:dataArray];
            [self.dataArray insertObject:firstModel atIndex:0];
            
//               category_id ==1 是国际,默认国际会展开
            if ([category_id integerValue]==1) {
               [self.dataArray enumerateObjectsUsingBlock:^(JCDataBaseAreaCountryModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (idx==0) {
                        obj.is_show = YES;
                    }
                    *stop = YES;
                }];
            }


            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];


}

- (void)initViews {
    
    self.title = self.model.name_zh;
//    [self.areaImgNavView sd_setImageWithURL:[NSURL URLWithString:self.model.area_logo]];
    
    
    self.tableView.separatorInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
    self.tableView.separatorColor = COLOR_DDDDDD;
    [self.tableView registerClass:[JCDatabaseMatchCell class] forCellReuseIdentifier:@"JCDatabaseMatchCell"];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArray.count;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JCDataBaseAreaCountryModel *model = self.dataArray[section];
    return model.is_show?model.competition_info.count:0;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(44);
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JCDatabaseMatchHeadView *view = [JCDatabaseMatchHeadView new];
    JCDataBaseAreaCountryModel *model = self.dataArray[section];
    view.model = model;
//    @weakify(view);
    WeakSelf;
    [view bk_whenTapped:^{
//        @strongify(view);
        model.is_show = !model.is_show;
        [weakSelf.tableView reloadData];
    }];
    return view;
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(44);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCDatabaseMatchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCDatabaseMatchCell"];
    JCDataBaseAreaCountryModel *model = self.dataArray[indexPath.section];
    JCDataBaseMatchModel *mathModel = model.competition_info[indexPath.row];
    cell.model = mathModel;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JCTeamMatchWMStickVC *vc = [JCTeamMatchWMStickVC new];
    JCDataBaseAreaCountryModel *model = self.dataArray[indexPath.section];
    JCDataBaseMatchModel *mathModel = model.competition_info[indexPath.row];
    vc.competition_id = mathModel.competition_id;
    [self.navigationController pushViewController:vc animated:YES];
    
//     [self.navigationController pushViewController:[JCTeamDetailWMStickVC new] animated:YES];

}


@end
