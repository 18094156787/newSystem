//
//  JCHomeSearchVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHomeSearchVC.h"
#import "JCSearchExpertCell.h"
#import "JCHongbangCommomCell.h"
#import "JCSearchTitleSectionView.h"
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCWMyHongbaoBall.h"
#import "JCHongbangWMstckyVC.h"
#import "JCDakaPlanDetailStickWMVC.h"
#import "JCFamousExpertCell.h"
#import "JCSearchHistoryView.h"
@interface JCHomeSearchVC ()<UISearchBarDelegate>

@property (nonatomic,strong) UISearchBar *searchBar;

@property (nonatomic,strong) JCSearchHistoryView *historySearchView;

@property (nonatomic,strong) NSArray *userArray;

@property (nonatomic,strong) NSMutableArray *matchArray;

@property (nonatomic,assign) BOOL isLoad;

@end

@implementation JCHomeSearchVC

-(void) viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    if (!self.isLoad) {
        [self performSelector:@selector(showKeyboard) withObject:nil afterDelay:0.1];
    }
    
}

-(void) showKeyboard
{
    [self.searchBar becomeFirstResponder];
    self.isLoad = YES;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self hideNavShadow];
    
//    self.navigationItem.leftBarButtonItem = nil;
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:0 target:self action:nil];
//    self.navigationItem.leftBarButtonItem = leftItem;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}


- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.matchArray = [NSMutableArray array];
    [self setupSearchView];
    [self initViews];
    [self getHotWord];
}

- (void)refreshData {
    self.pageNo = 1;
    [self searchData];
}

- (void)searchData {
    [self.view showLoading];
    
    JCHomeService_New *service = [JCHomeService_New service];
    [service getHomeSearchDataWithContent:NonNil(self.searchBar.text) page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
        self.historySearchView.hidden = YES;
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.matchArray removeAllObjects];
            }
            
            self.userArray = [NSArray yy_modelArrayWithClass:[JCWExpertBall class] json:object[@"data"][@"expert_talent_info"]];
            NSArray *array = object[@"data"][@"plan_info"];
            for (NSDictionary *dic in array) {
                if (dic[@"base_info"][@"type"]) {
                    NSString *type = dic[@"base_info"][@"type"];//1公众号方案 2达人方案
                    if ([type integerValue]==1) {
                        JCWTjInfoBall *model = (JCWTjInfoBall *)[JCWJsonTool entityWithJson:dic[@"base_info"] class:[JCWTjInfoBall class]];
                        [self.matchArray addObject:model];
                    }
                    if ([type integerValue]==2) {
                        JCHongBangBall *model = (JCHongBangBall *)[JCWJsonTool entityWithJson:dic class:[JCHongBangBall class]];
                        [self.matchArray addObject:model];
                    }
                }

            }

            self.pageNo++;
            [self.tableView reloadData];

            if (self.userArray.count==0&&self.matchArray.count==0) {
                [self chageImageStr:@"nodata_fangan" Title:@"没有想要的结果，换个搜索词试试~~" BtnTitle:@""];
            }else {
//                [self.tableView ly_hideEmptyView];
            }
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];

            }


        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        self.userArray = @[];
        [self.matchArray removeAllObjects];
         [self.tableView reloadData];
        [self endRefresh];
        [self chageTitle:@"没有想要的结果" DetailStr:@"换个搜索词试试~~" BtnTitle:@""];
    }];

}

- (void)getHotWord {
    JCHomeService_New *service = [JCHomeService_New service];
    [service getHomeSearchHotWordWithSuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {

//            self.userArray = [NSArray yy_modelArrayWithClass:[JCWExpertBall class] json:object[@"data"][@"expert_talent_info"]];
            NSString *hotWord = object[@"data"][@"hot_search_work_ios"];
            NSArray *hotArray = [NSArray array];
            if (hotWord.length>0) {
                hotArray = [hotWord componentsSeparatedByString:@","];
                if (hotArray.count>0) {
                    self.historySearchView.hotArray = hotArray;
                }
            }
            
            
            
            id object_data = [[NSUserDefaults standardUserDefaults] objectForKey:JCSearch_Home_FootBall];

            if (object_data) {
                NSArray *dataArray =  [NSJSONSerialization JSONObjectWithData:object_data options:NSJSONReadingAllowFragments error:nil];
                if (dataArray.count==0&&hotArray.count==0) {
                    self.historySearchView.hidden = YES;
                }else {
                    self.historySearchView.hidden = NO;
                    self.historySearchView.historyArray = [NSMutableArray arrayWithArray:dataArray];
                }

            }else {
                self.historySearchView.hidden = hotArray.count>0?NO:YES;
            }
            

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        
        id object_data = [[NSUserDefaults standardUserDefaults] objectForKey:JCSearch_Home_FootBall];

        if (object_data) {
            NSArray *dataArray =  [NSJSONSerialization JSONObjectWithData:object_data options:NSJSONReadingAllowFragments error:nil];
            if (dataArray.count==0) {
                self.historySearchView.hidden = YES;
            }
            self.historySearchView.historyArray = [NSMutableArray arrayWithArray:dataArray];
        }else {
            self.historySearchView.hidden = YES;
        }
        
    }];

}

- (void)setupSearchView {
    UIView *titleView = [[UIView alloc] init];
    titleView.frame = CGRectMake(0, 0, SCREEN_WIDTH-AUTO(60), 32);
    titleView.backgroundColor = JCWhiteColor;
    [titleView hg_setAllCornerWithCornerRadius:16];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:titleView.bounds];

    
    searchBar.layer.cornerRadius = 2;
    searchBar.layer.masksToBounds = YES;
//    searchBar.placeholder = @"";
    
//    searchBar.translucent = YES;
    [searchBar setImage:JCIMAGE(@"icon_ser") forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    [titleView addSubview:searchBar];
    self.navigationItem.titleView = titleView;
    searchBar.delegate = self;
 
    searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    

                if (@available(iOS 13.0, *)) {

                    UITextField *searchField = searchBar.searchTextField;
                    searchField.backgroundColor = COLOR_F0F0F0;
        //            searchField.textColor = COLOR_B2BACD;
                    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"搜索方案，专家，达人" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:13]}];//NSForegroundColorAttributeName:COLOR_B2BACD
                    searchField.attributedPlaceholder = string;
        //              [searchBar setSearchFieldBackgroundImage:JCIMAGE(@"clearImage") forState:0];
        //            searchBar.searchTextField.font = [UIFont systemFontOfSize:13];

                }else{
                        for (UIView *subView in [[searchBar.subviews lastObject] subviews]) {
                             if([subView isKindOfClass:NSClassFromString(@"UISearchBarSearchFieldBackgroundView")]) {
                                 subView.backgroundColor = COLOR_F0F0F0;
                             }
                            float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
                    
                            if (systemVersion <13.0) {
                                if([subView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                                    [subView removeFromSuperview];
                                }
                            }
                    
                    
                             if ([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                                 UITextField *textField = (UITextField *)subView;
                                 textField.borderStyle = UITextBorderStyleNone;
                                 textField.font = [UIFont systemFontOfSize:13];
                                 textField.backgroundColor = COLOR_F4F6F9;
                                 textField.layer.cornerRadius= 16;
                                 textField.layer.masksToBounds = YES;
                                 NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"搜索方案，专家，达人" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:13]}];//NSForegroundColorAttributeName:COLOR_B2BACD
                                 textField.attributedPlaceholder = string;
                    //             textField.backgroundColor = [UIColor whiteColor];
                    //             [textField hg_setAllCornerWithCornerRadius:22];
                    
                             }
                         }
                }
//    [self.searchBar becomeFirstResponder];
    self.searchBar = searchBar;
    

    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"common_title_back_black_bold") style:0 target:self action:@selector(backItemClick)];
    leftItem.tintColor = COLOR_2F2F2F;
    self.navigationItem.leftBarButtonItem = leftItem;
//
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:0 target:self action:@selector(rightItemClick)];
    rightItem.tintColor = JCBaseColor;
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)initViews {
    // 表格注册cell
    self.tableView.separatorStyle = 1;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.separatorColor = COLOR_DDDDDD;
    [self.tableView registerClass:[JCSearchExpertCell class] forCellReuseIdentifier:@"JCSearchExpertCell"];
    [self.tableView registerClass:[JCHongbangCommomCell class] forCellReuseIdentifier:@"JCHongbangCommomCell"];
    [self.tableView registerClass:[JCFamousExpertCell class] forCellReuseIdentifier:@"JCFamousExpertCell"];
    
    
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = -AUTO(80);
    self.tableView.ly_emptyView = emptyView;
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
//
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf searchData];
    }];
    
    self.historySearchView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:self.historySearchView];

    self.historySearchView.JCSearchBlock = ^(NSString * _Nonnull text) {
        [weakSelf.searchBar endEditing:YES];
        weakSelf.historySearchView.hidden = YES;
        weakSelf.searchBar.text = text;
        [weakSelf searchData];
    };


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return self.userArray.count;
    }
    if (section==1) {
        return self.matchArray.count;
    }
    return 0;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return AUTO(68);
    }
    return UITableViewAutomaticDimension;
//     return AUTO(88);
}




- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JCSearchTitleSectionView *view = [JCSearchTitleSectionView new];
    if (section==0) {
        view.titleLab.text = self.userArray.count>0?@"专家/达人":@"";
        return self.userArray.count>0?view:[UIView new];
    }
    if (section==1) {
        view.titleLab.text = self.matchArray.count>0?@"方案":@"";
        return self.matchArray.count>0?view:[UIView new];
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return self.userArray.count>0?AUTO(45):0.01f;
    }
    return self.matchArray.count>0?AUTO(45):0.01f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = self.matchArray.count>0?COLOR_F4F6F9:JCWhiteColor;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==0) {
        return self.userArray.count>0?AUTO(8):0.01f;
    }
    return 0.001f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section==0) {
        JCSearchExpertCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCSearchExpertCell"];
        JCWExpertBall *model = self.userArray[indexPath.row];
        cell.model = model;
        WeakSelf;
        cell.JCConcernBlock = ^{
            [weakSelf concernTuiJianWithModel:model];
        };
        return cell;
    }
    id model = self.matchArray[indexPath.row];
    if ([model isKindOfClass:[JCHongBangBall class]]) {
        JCHongbangCommomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangCommomCell"];
        cell.dianPingBall = model;
        return cell;
    }else{
        JCFamousExpertCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCFamousExpertCell"];
        cell.model = model;
        return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        JCWExpertBall *model = self.userArray[indexPath.row];
        if ([model.type integerValue]==1) {
            JCHongbangWMstckyVC *vc = [JCHongbangWMstckyVC new];
            vc.autherID = model.user_id;
            [self.navigationController pushViewController:vc animated:YES];
        }
        if ([model.type integerValue]==2) {
            JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
            vc.autherID = model.user_id;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    if (indexPath.section==1) {
        if (![JCWUserBall currentUser]) {
            [self presentLogin];
            return ;
        }
        id model = self.matchArray[indexPath.row];
        if ([model isKindOfClass:[JCHongBangBall class]]) {
            //红榜
            JCHongBangBall *dianPingBall = (JCHongBangBall *)model;
            [JCTuiJianManager getTuiJianDetailWithTuiJianID:dianPingBall.base_info.tuijian_id orderID:@"" type:@"" WithViewController:self is_push:YES success:^{
                
            }];

        }else{
            //公众号
            JCWTjInfoBall *gzhBall = (JCWTjInfoBall *)model;
            [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:gzhBall.tuijian_id orderID:@"" type:@"" WithViewController:self is_push:YES];

        }
        
        

    }
}

- (void)concernTuiJianWithModel:(JCWExpertBall *)model{
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    WeakSelf;
    BOOL isAdd = NO;
    if ([model.is_subscribe isEqualToString:@"关注"]) {
        isAdd = YES;
    }
    [self.view showLoading];
    JCHomeService_New * service = [JCHomeService_New service];
////    //默认是公众号
//    NSString *type = @"1";
////    NSString *user_ID =model.user_id;
////
//    if ([model.type integerValue]==1) {
//        //如果是红榜
//        type = @"2";
//    }
    [service gzUserWithId:model.user_id type:model.type success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            //1是未关注.2是已关注
            NSString *status = [NSString stringWithFormat:@"%@",object[@"data"][@"status"]];
            model.is_subscribe = [status integerValue]==2?@"已关注":@"关注";
            model.fensi = object[@"data"][@"fensi"];
            [weakSelf.tableView reloadData];

        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];


}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar endEditing:YES];

    if (searchBar.text.length==0) {
        return;
    }
    self.historySearchView.hidden = YES;
    id object_data = [[NSUserDefaults standardUserDefaults] objectForKey:JCSearch_Home_FootBall];
    NSArray *dataArray = @[];
    if (object_data) {
        dataArray =  [NSJSONSerialization JSONObjectWithData:object_data options:NSJSONReadingAllowFragments error:nil];
    }

    NSMutableArray *dataSource = [NSMutableArray arrayWithArray:dataArray];
    if ([dataSource containsObject:searchBar.text]) {
        [dataSource removeObject:searchBar.text];
        [dataSource insertObject:searchBar.text atIndex:0];
    }else{
        [dataSource insertObject:searchBar.text atIndex:0];
    }
    if (dataSource.count>10) {
        [dataSource removeLastObject];
    }
//
    
    self.historySearchView.historyArray = dataSource;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dataSource options:NSJSONWritingPrettyPrinted error:nil];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:JCSearch_Home_FootBall];
    
    
    [self searchData];

}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchBar.text.length==0) {
        self.historySearchView.hidden = NO;
    }
    if (searchBar.text.length>20) {
        searchBar.text = [searchBar.text substringToIndex:20];
    }
    

}

- (void)backItemClick {
//    [self.view endEditing:YES];
    [self.searchBar endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightItemClick {
    [self searchBarSearchButtonClicked:self.searchBar];
}
- (JCSearchHistoryView *)historySearchView {
    if (!_historySearchView) {
        _historySearchView = [JCSearchHistoryView new];
        _historySearchView.type = 0;
    }
    return _historySearchView;
}
@end
