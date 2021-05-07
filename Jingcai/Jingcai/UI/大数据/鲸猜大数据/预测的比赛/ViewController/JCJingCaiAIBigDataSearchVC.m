//
//  JCJingCaiAIBigDataSearchVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataSearchVC.h"
#import "JCJingCaiAIBigDataMatchCell.h"
#import "JCMatchInfoModel.h"
#import "JCSearchHistoryView.h"
@interface JCJingCaiAIBigDataSearchVC ()<UISearchBarDelegate>

@property (nonatomic,strong) UISearchBar *searchBar;

@property (nonatomic,strong) NSArray *userArray;

@property (nonatomic,strong) NSMutableArray *matchArray;

@property (nonatomic,strong) JCSearchHistoryView *historySearchView;

@property (nonatomic,assign) BOOL isLoad;

@end

@implementation JCJingCaiAIBigDataSearchVC

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!self.isLoad) {
        [self performSelector:@selector(showKeyboard) withObject:nil afterDelay:0.1];
    }
    
}

-(void)showKeyboard
{
    [self.searchBar becomeFirstResponder];
    self.isLoad = YES;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self hideNavShadow];
    self.navigationItem.leftBarButtonItem = nil;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:0 target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftItem;
    
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
}

- (void)refreshData {
    self.pageNo = 1;
    [self searchData];
}

- (void)searchData {
    if (self.searchBar.text.length==0) {
        return;
    }
    [self.view showLoading];
    JCMatchService_New *service = [JCMatchService_New new];
    [service getPredictedMatchListWithType:@"1" Key_word:NonNil(self.searchBar.text) Page:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
         
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCMatchInfoModel class]];
             [self.dataArray addObjectsFromArray:array];
            if (array.count <PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];
            self.pageNo++;
            [self chageImageStr:@"nodata_fangan" Title:@"没有想要的结果，换个搜索词试试~~" BtnTitle:@""];
            
            if (array.count < PAGE_LIMIT&&self.dataArray.count>0) {
                  self.tableView.tableFooterView = self.noMore_footView;
                  self.tableView.mj_footer.hidden = YES;
              }else{
                  self.tableView.tableFooterView = [UIView new];
                  self.tableView.mj_footer.hidden = NO;
              }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self chageImageStr:@"nodata_fangan" Title:@"没有想要的结果，换个搜索词试试~~" BtnTitle:@""];
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
                    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"搜索球队、赛事" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:13]}];//NSForegroundColorAttributeName:COLOR_B2BACD
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
                                 NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"搜索球队、赛事" attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:13]}];//NSForegroundColorAttributeName:COLOR_B2BACD
                                 textField.attributedPlaceholder = string;
                    //             textField.backgroundColor = [UIColor whiteColor];
                    //             [textField hg_setAllCornerWithCornerRadius:22];
                    
                             }
                         }
                }
//    [self.searchBar becomeFirstResponder];
    self.searchBar = searchBar;
    

    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:0 target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:0 target:self action:@selector(rightItemClick)];
    rightItem.tintColor = JCBaseColor;
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)initViews {

    
    
    
    // 表格注册cell
    self.tableView.separatorStyle = 1;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.backgroundColor = COLOR_F0F0F0;
    [self.tableView registerClass:[JCJingCaiAIBigDataMatchCell class] forCellReuseIdentifier:@"JCJingCaiAIBigDataMatchCell"];

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
        [weakSelf refreshData];
    };
    id object_data = [[NSUserDefaults standardUserDefaults] objectForKey:JCSearch_BigData];

    if (object_data) {
        NSArray *dataArray =  [NSJSONSerialization JSONObjectWithData:object_data options:NSJSONReadingAllowFragments error:nil];
        if (dataArray.count==0) {
            self.historySearchView.hidden = YES;
        }
        self.historySearchView.historyArray = [NSMutableArray arrayWithArray:dataArray];
    }else {
        self.historySearchView.hidden = YES;
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    footView.backgroundColor = COLOR_F0F0F0;
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return AUTO(8);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCJingCaiAIBigDataMatchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCJingCaiAIBigDataMatchCell"];
    JCMatchInfoModel *model = self.dataArray[indexPath.section];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    
//    JCMatchInfoTitleModel *titleModel = self.dataArray[indexPath.section];
    JCMatchInfoModel *model = self.dataArray[indexPath.section];
    JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];//JNMatchDetailVC
    detailVC.matchNum = model.match_id;//JCMatchDetailWMStickVC
//    detailVC.matchNum = @"3518682";
    
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar endEditing:YES];
    if (searchBar.text.length==0) {
        return;
    }
    self.historySearchView.hidden = YES;
    id object_data = [[NSUserDefaults standardUserDefaults] objectForKey:JCSearch_BigData];
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
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:JCSearch_BigData];
    
    [self refreshData];

}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchBar.text.length==0) {
        self.historySearchView.hidden = NO;
    }
    if (searchBar.text.length>20) {
        searchBar.text = [searchBar.text substringToIndex:20];
    }

}

- (void)rightItemClick {
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (JCSearchHistoryView *)historySearchView {
    if (!_historySearchView) {
        _historySearchView = [JCSearchHistoryView new];
        _historySearchView.type = 3;
    }
    return _historySearchView;
}

@end
